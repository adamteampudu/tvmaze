//
//  ShowsListViewController.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

class ShowsListViewController: BaseViewController<ShowsListViewModel, ShowsCoordinator> {

    enum Constants {
        static let rowHeight: CGFloat = 100
    }

    @IBOutlet private weak var tableView: UITableView!

    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.onViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavigationBar()
    }

    private func setupUI() {
        title = L10n.shows
        setupTableView()
    }

    private func setupTableView() {

        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false

        tableView.tableHeaderView = searchController.searchBar
        tableView.register(ShowsListTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = Constants.rowHeight
    }

    private func bindViewModel() {

        subscribe(observable: viewModel.reloadViewPublishObservable)  { [weak self] _ in
            guard let self = self else { return }
            self.tableView.reloadData()
        }

        subscribe(observable: viewModel.goToScenePublishObservable) { [weak self] goToScene in
            guard let self = self else { return }
            self.coordinator.goToScene(goToScene, from: self)
        }
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

extension ShowsListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.filterResults(text: searchController.searchBar.text)
    }
}
