//
//  PersonDetailViewController.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import UIKit

final class PersonDetailViewController: BaseViewController<
                                            PersonDetailViewModel,
                                            PeopleCoordinator> {

    private enum Constants {
        static let sectionHeaderHeight: CGFloat = 30
        static let sectionHeaderHeightNone: CGFloat = .leastNonzeroMagnitude
        static let rowHeight: CGFloat = 60
    }

    private var tableViewHeader: PersonDetailHeaderView!

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

        tableViewHeader = PersonDetailHeaderView.initWithNib()
        tableView.register(PersonDetailTableViewCell.self)
        tableView.register(
            PersonDetailSectionHeaderView.self,
            forHeaderFooterViewReuseIdentifier: String(describing: PersonDetailSectionHeaderView.self)
        )
        tableView.delegate = self
        tableView.dataSource = self

        tableView.rowHeight = Constants.rowHeight
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.tableHeaderView = tableViewHeader
        tableView.contentInset.bottom = view.safeAreaInsets.bottom
    }

    private func bindViewModel() {
        subscribe(observable: viewModel.reloadViewPublishObservable) { [weak self] _ in
            guard let self = self else { return }
            self.tableView.reloadData()
        }

        subscribe(observable: viewModel.argsObservable) { [weak self] in
            guard let self = self else { return }
            self.tableViewHeader.setup(with: $0.person)
            self.title = $0.person.name
        }

        subscribe(observable: viewModel.goToScenePublishObservable) { [weak self] goToScene in
            guard let self = self else { return }
            self.coordinator.goToScene(goToScene, from: self)
        }

    }

}

extension PersonDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.crewRoles.count
        } else if section == 1 {
            return viewModel.castRoles.count
        }
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(
            withIdentifier: PersonDetailTableViewCell.identifier,
            for: indexPath
        )
        if let PersonDetailTableViewCell = cell as? PersonDetailTableViewCell {
            if indexPath.section == 0 {
                PersonDetailTableViewCell.setup(with: viewModel.crewRoles[indexPath.row])
            } else if indexPath.section == 1 {
                PersonDetailTableViewCell.setup(with: viewModel.castRoles[indexPath.row])
            }
        }
        return cell

    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Crew"
        } else if section == 1 {
            return "Cast"
        }
        return nil
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.onSelection(indexPath: indexPath)
    }

}
