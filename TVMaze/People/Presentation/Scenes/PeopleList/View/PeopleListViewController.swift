//
//  PeopleListViewController.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit
import RxSwift
import RxCocoa

class PeopleListViewController: BaseViewController<PeopleListViewModel, PeopleCoordinator> {

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

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavigationBar()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchTextField.resignFirstResponder()
    }

    private func setupUI() {
        title = L10n.people
        setupTableView()
    }

    private func setupTableView() {

        tableView.tableHeaderView = searchView
        tableView.register(PeopleListTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = Constants.rowHeight
    }

    private func bindViewModel() {

        subscribe(observable: viewModel.reloadPublishObservable) { [weak self] _ in
            guard let self = self else { return }
            self.tableView.reloadData()
        }

        subscribe(observable: viewModel.goToScenePublishObservable) { [weak self] goToScene in
            guard let self = self else { return }
            self.coordinator.goToScene(goToScene, from: self)
        }

        searchTextField.rx
            .controlEvent([.editingChanged])
            .withLatestFrom(searchTextField.rx.text.orEmpty)
            .debounce(
                .milliseconds(400),
                scheduler: MainScheduler.asyncInstance
            )
            .subscribe(onNext: { [weak self] searchTerm in
                self?.viewModel.onSearch(text: searchTerm)
            })
            .disposed(by: disposeBag)
    }

}

extension PeopleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.people.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: PeopleListTableViewCell.identifier,
            for: indexPath
        )
        if let tvSeriesListTableViewCell = cell as? PeopleListTableViewCell {
            tvSeriesListTableViewCell.setup(with: viewModel.people[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.onSelection(row: indexPath.row)
    }
}
