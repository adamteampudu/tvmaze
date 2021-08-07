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

    @IBOutlet private weak var tableView: UITableView!

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

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateHeaderViewHeight()
    }

    private func setupTableView() {

        let nibName = UINib(nibName: "ShowDetailHeader", bundle: nil)
        self.tableView.register(nibName, forHeaderFooterViewReuseIdentifier: "ShowDetailHeader")

        tableView.register(ShowsListTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension

    }

    private func bindViewModel() {
        subscribe(observable: viewModel.reloadViewPublishObservable)  { [weak self] _ in
            guard let self = self else { return }
            self.tableView.reloadData()
        }

//        subscribe(observable: viewModel.argsObservable) { [weak self] in
//            self?.nameLabel.text = $0.show.name
//
//            if let posterImage = $0.show.image,
//               let posterOriginal = posterImage.original,
//               let posterImageUrl = URL(string: posterOriginal) {
//                self?.poster.set(style: .networking)
//                self?.poster.setImage(from: posterImageUrl)
//            }
////            self?.genresLabel.text = $0.show.ge
//            self?.summaryLabel.attributedText = $0.show.summary?.htmlToAttributedString
//            self?.genresLabel.attributedText = $0.show.summary?.htmlToAttributedString
//        }
    }

    func updateHeaderViewHeight() {
        if let header = tableView.tableHeaderView {
            let newSize = header.systemLayoutSizeFitting(CGSize(width: self.view.bounds.width, height: 0))
            header.frame.size.height = newSize.height
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
//        let cell = tableView.dequeueReusableCell(
//            withIdentifier: ShowsListTableViewCell.identifier,
//            for: indexPath
//        )
//        if let tvSeriesListTableViewCell = cell as? ShowsListTableViewCell {
//            tvSeriesListTableViewCell.setup(with: viewModel.filteredShows[indexPath.row])
//        }
//        return cell
        let cell = UITableViewCell()
        cell.textLabel?.text = viewModel.episodesBySeason[indexPath.section]?[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Season \(section)"
    }

    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: false)
//        viewModel.onSelection(row: indexPath.row)
//    }

//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 200
//    }
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if section == 0 {
//            let headerView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "ShowDetailHeader" ) as! ShowDetailHeader
//            headerView.setup(with: viewModel.show)
//             return headerView
//        }
//        return nil
//    }
}
