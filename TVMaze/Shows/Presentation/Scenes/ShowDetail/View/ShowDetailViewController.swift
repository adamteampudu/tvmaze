//
//  ShowDetailViewController.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import UIKit

final class ShowDetailViewController: BaseViewController<
                                            ShowDetailViewModel,
                                            ShowsCoordinator> {

    private enum Constants {
        static let sectionHeaderHeight: CGFloat = 30
        static let sectionHeaderHeightNone: CGFloat = .leastNonzeroMagnitude
        static let rowHeight: CGFloat = 40
    }

    private var tableViewHeader: ShowDetailHeaderView!

    @IBOutlet private weak var tableView: UITableView!

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
    }

    private func setupUI() {
        setupTableView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let headerView = tableView.tableHeaderView {
            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var headerFrame = headerView.frame

            // comparison necessary to avoid infinite loop
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                headerView.frame = headerFrame
                tableView.tableHeaderView = headerView
            }
        }
    }

    private func setupTableView() {

        tableViewHeader = ShowDetailHeaderView.initWithNib()
        tableViewHeader.delegate = self
        tableView.register(ShowDetailTableViewCell.self)
        tableView.register(
            ShowDetailSectionHeaderView.self,
            forHeaderFooterViewReuseIdentifier: String(describing: ShowDetailSectionHeaderView.self)
        )
        tableView.delegate = self
        tableView.dataSource = self

        tableView.rowHeight = Constants.rowHeight
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.tableHeaderView = tableViewHeader
    }

    private func bindViewModel() {
        subscribe(observable: viewModel.reloadViewPublishObservable) { [weak self] _ in
            guard let self = self else { return }
            self.tableView.reloadData()
        }

        subscribe(observable: viewModel.argsObservable) { [weak self] in
            guard let self = self else { return }
            self.tableViewHeader.setup(
                with: $0.show,
                isFavorite: self.viewModel.isFavorite
            )
            self.title = $0.show.name
        }

        subscribe(observable: viewModel.goToScenePublishObservable) { [weak self] goToScene in
            guard let self = self else { return }
            self.coordinator.goToScene(goToScene, from: self)
        }

        subscribe(observable: viewModel.isFavoritePublishObservable) { [weak self] isFavorite in
            guard let self = self else { return }
            self.tableViewHeader.setup(
                with: self.viewModel.show,
                isFavorite: self.viewModel.isFavorite
            )
        }

    }

}

extension ShowDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.episodesBySeason.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.episodesBySeason[section]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: ShowDetailTableViewCell.identifier,
            for: indexPath
        )
        if let showDetailTableViewCell = cell as? ShowDetailTableViewCell {
            if let season = viewModel.episodesBySeason[indexPath.section] {
                showDetailTableViewCell.setup(with: season[indexPath.row])
            }
        }
        return cell

    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        if viewModel.episodesBySeason[section]?.count ?? 0 > 0 {
            if let view = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: String(describing: ShowDetailSectionHeaderView.self)
            ) as? ShowDetailSectionHeaderView {
                view.set(title: "\(L10n.season) \(section)")
                return view
            }
        }
        return nil
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if viewModel.episodesBySeason[section]?.count ?? 0 > 0 {
            return Constants.sectionHeaderHeight
        }
        return Constants.sectionHeaderHeightNone
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.onSelection(indexPath: indexPath)
    }

}

extension ShowDetailViewController: ShowDetailHeaderViewDelegate {
    func tappedMarkAsFavorite() {
        viewModel.tappedMarkAsFavorite()
    }
}
