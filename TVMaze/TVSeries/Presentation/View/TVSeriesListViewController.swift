//
//  TVSeriesListViewController.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

class TVSeriesListViewController: BaseViewController<TVSeriesListViewModel, TVSeriesCoordinator> {

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
        tableView.register(TVSeriesListTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = Constants.rowHeight
    }

    private func bindViewModel() {
        viewModel.reloadTVSeriesPublishObservable.subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.tableView.reloadData()
        })
        .disposed(by: disposeBag)
    }
}

extension TVSeriesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.filteredShows.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TVSeriesListTableViewCell.identifier,
            for: indexPath
        )
        if let tvSeriesListTableViewCell = cell as? TVSeriesListTableViewCell {
            tvSeriesListTableViewCell.setup(with: viewModel.filteredShows[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.onSelection(row: indexPath.row)
    }

}

extension TVSeriesListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.filterResults(text: searchController.searchBar.text)
    }
}
