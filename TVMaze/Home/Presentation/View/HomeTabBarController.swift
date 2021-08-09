//
//  HomeTabBarController.swift
//  TVMaze
//
//  Created by Adam Teale on 08-08-21.
//

import UIKit
import RxSwift

class HomeTabBarController: UITabBarController {

    private let showsListViewController: ShowsListViewController
    private let peopleListViewController: PeopleListViewController
    private let viewModel: HomeTabBarViewModel

    private let disposeBag = DisposeBag()

    init(
        showsListViewController: ShowsListViewController,
        peopleListViewController: PeopleListViewController,
        viewModel: HomeTabBarViewModel
    ) {
        self.showsListViewController = showsListViewController
        self.peopleListViewController = peopleListViewController
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupUI()
    }

    private func setupUI() {
        setTabBarItems()
    }

    private func bindViewModel() {
        viewModel.titleObservable.subscribe(onNext: { [weak self] title in
            self?.navigationItem.title = title
        }).disposed(by: disposeBag)
    }

    private func setTabBarItems() {
        showsListViewController.tabBarItem = UITabBarItem(
            title: L10n.shows,
            image: nil,
            selectedImage: nil
        )
        showsListViewController.tabBarItem.tag = TabBarItemType.shows.rawValue

        peopleListViewController.tabBarItem = UITabBarItem(
            title: L10n.people,
            image: nil,
            selectedImage: nil
        )
        peopleListViewController.tabBarItem.tag = TabBarItemType.people.rawValue

        viewControllers = [
            showsListViewController,
            peopleListViewController
        ]
    }

    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        viewModel.setNavigationItem(item.tag)
    }
}
