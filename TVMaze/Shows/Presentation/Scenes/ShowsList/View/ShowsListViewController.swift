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
    }

    @IBOutlet private var searchView: UIView!
    @IBOutlet private var searchTextField: UITextField! {
        didSet {
            searchTextField.placeholder = L10n.search
            searchTextField.addTarget(
                self,
                action: #selector(searchTextChanged),
                for: .editingChanged
            )
            searchTextField.clearButtonMode = .always
        }
    }
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var showAllButton: UIButton! {
        didSet {
            showAllButton.setTitle(L10n.showAll, for: .normal)
        }
    }
    @IBOutlet private var showFavoritesButton: UIButton! {
        didSet {
            showFavoritesButton.setTitle(L10n.showFavorites, for: .normal)
        }
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
            self.showAllButton.isEnabled = showFavorites
            self.showFavoritesButton.isEnabled = !showFavorites
        }

        subscribe(observable: viewModel.goToScenePublishObservable) { [weak self] goToScene in
            guard let self = self else { return }
            self.coordinator.goToScene(goToScene, from: self)
        }
    }

    @objc func searchTextChanged() {
        viewModel.onFilterResults(text: searchTextField.text)
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

}
