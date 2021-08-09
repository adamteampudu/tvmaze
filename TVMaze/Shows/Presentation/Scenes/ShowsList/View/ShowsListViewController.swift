//
//  ShowsListViewController.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

class ShowsListViewController: BaseViewController<ShowsListViewModel, ShowsCoordinator> {

    private enum Constants {
        static let rowHeight: CGFloat = 100
        static let cornerRadius: CGFloat = 5
        static let borderWidth: CGFloat = 1
    }

    @IBOutlet private var searchView: UIView! {
        didSet {
            let border = UIView()
            border.backgroundColor = Asset.Colors.primary.color.withAlphaComponent(0.1)
            border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
            border.frame = CGRect(
                x: 0,
                y: searchView.frame.size.height - Constants.borderWidth,
                width: searchView.frame.size.width,
                height: Constants.borderWidth
            )
            searchView.addSubview(border)
        }
    }
    @IBOutlet private var searchTextField: UITextField! {
        didSet {
            searchTextField.placeholder = L10n.search
            searchTextField.clearButtonMode = .always
        }
    }
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var showAllButton: UIButton! {
        didSet {
            showAllButton.setTitle(L10n.showAll, for: .normal)
            showAllButton.setTitleColor(Asset.Colors.primaryText.color, for: .normal)
            showAllButton.setTitleColor(Asset.Colors.highlight  .color, for: .selected)
            showAllButton.backgroundColor = Asset.Colors.primary.color
            showAllButton.layer.cornerRadius = Constants.cornerRadius
        }
    }
    @IBOutlet private var showFavoritesButton: UIButton! {
        didSet {
            showFavoritesButton.setTitle(L10n.showFavorites, for: .normal)
            showFavoritesButton.setTitleColor(Asset.Colors.primaryText.color, for: .normal)
            showFavoritesButton.setTitleColor(Asset.Colors.highlight.color, for: .selected)
            showFavoritesButton.backgroundColor = Asset.Colors.primary.color
            showFavoritesButton.layer.cornerRadius = Constants.cornerRadius
        }
    }
    @IBOutlet private var bottomView: UIView! {
        didSet {
            let border = UIView()
            border.backgroundColor = Asset.Colors.primary.color.withAlphaComponent(0.1)
            border.autoresizingMask = [.flexibleWidth, .flexibleBottomMargin]
            border.frame = CGRect(
                x: 0,
                y: 0,
                width: bottomView.frame.size.width,
                height: Constants.borderWidth
            )
            bottomView.addSubview(border)
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.onViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavigationBar()
        viewModel.onViewWillAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchTextField.resignFirstResponder()
    }

    private func setupUI() {
        title = L10n.shows
        tabBarController?.title = L10n.shows
        setupTableView()
    }

    private func setupTableView() {

        tableView.tableHeaderView = searchView
        tableView.register(ShowsListTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = Constants.rowHeight
    }

    private func bindViewModel() {

        subscribe(observable: viewModel.reloadViewWithFavoritesPublishObservable) { [weak self] showFavorites in
            guard let self = self else { return }
            self.tableView.reloadData()
            self.showAllButton.isSelected = !showFavorites
            self.showFavoritesButton.isSelected = showFavorites
        }

        subscribe(observable: viewModel.goToScenePublishObservable) { [weak self] goToScene in
            guard let self = self else { return }
            self.coordinator.goToScene(goToScene, from: self)
        }

        searchTextField.rx
            .controlEvent([.editingChanged])
            .withLatestFrom(searchTextField.rx.text.orEmpty)
            .subscribe(onNext: { [weak self] searchTerm in
                self?.viewModel.onFilterResults(text: searchTerm)
            })
            .disposed(by: disposeBag)
    }

    @IBAction func showAll(_ sender: Any) {
        viewModel.onShowAll()
    }

    @IBAction func showFavorites(_ sender: Any) {
        viewModel.onShowFavorites()
    }

}

extension ShowsListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredShows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ShowsListTableViewCell.identifier,
            for: indexPath
        )
        if let tvSeriesListTableViewCell = cell as? ShowsListTableViewCell {
            tvSeriesListTableViewCell.setup(with: viewModel.filteredShows[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.onSelection(row: indexPath.row)
    }

//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        viewModel.showFavorites
//    }

    func tableView(
        _ tableView: UITableView,
        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {

        let markAsFavorite = UIContextualAction(
            style: .normal,
            title: viewModel.filteredShows[indexPath.row].isFavorite ? L10n.removeFromFavorites : L10n.addToFavorites
        ) { (_, _, _) in
            self.tableView.isEditing = false
            self.viewModel.onUpdateShowIdAsFavorite(atRow: indexPath.row)
        }

        let swipeActionConfig = UISwipeActionsConfiguration(actions: [markAsFavorite])
        swipeActionConfig.performsFirstActionWithFullSwipe = true
        return swipeActionConfig
    }

}
