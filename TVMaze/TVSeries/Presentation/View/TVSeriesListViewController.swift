//
//  TVSeriesListViewController.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

class TVSeriesListViewController: BaseViewController<TVSeriesListViewModel, TVSeriesCoordinator> {

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
        viewModel.onViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavigationBar()
    }

    private func setupTableView() {
        tableView.register(TVSeriesListTableViewCell.self)

        tableView.delegate = self
        tableView.dataSource = self
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
        viewModel.tvSeries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: TVSeriesListTableViewCell.identifier,
            for: indexPath
        )
        if let tvSeriesListTableViewCell = cell as? TVSeriesListTableViewCell {
            tvSeriesListTableViewCell.setup(with: viewModel.tvSeries[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.onSelection(row: indexPath.row)
    }

}
