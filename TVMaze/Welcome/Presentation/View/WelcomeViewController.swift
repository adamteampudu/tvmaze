//
//  WelcomeViewController.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

final class WelcomeViewController: BaseViewController<WelcomeViewModel, WelcomeCoordinator> {

    enum Constants {
        static let buttonCornerRadius: CGFloat = 4
    }

    @IBOutlet private var logoImageView: UIImageView! {
        didSet {
            logoImageView.image = Asset.Assets.tvmHeaderLogo.image
        }
    }

    @IBOutlet private var labelTop: UILabel! {
        didSet {
            labelTop.text = L10n.searchForYourFavoriteActors
            labelTop.font = .systemFont(
                ofSize: TextSize.header,
                weight: .medium
            )
            labelTop.textColor = Asset.Colors.primary.color
            labelTop.numberOfLines = 0
        }
    }

    @IBOutlet private var labelMiddle: UILabel! {
        didSet {
            labelMiddle.text = L10n.rateYourFavorites
            labelMiddle.font = .systemFont(
                ofSize: TextSize.header,
                weight: .medium
            )
            labelMiddle.textColor = Asset.Colors.primary.color
            labelMiddle.numberOfLines = 0
        }
    }

    @IBOutlet private var labelBottom: UILabel! {
        didSet {
            labelBottom.text = L10n.createYourWatchlist
            labelBottom.font = .systemFont(
                ofSize: TextSize.header,
                weight: .medium
            )
            labelBottom.textColor = Asset.Colors.primary.color
            labelBottom.numberOfLines = 0
        }
    }

    @IBOutlet private var continueButton: UIButton! {
        didSet {
            continueButton.setTitle(L10n.continue, for: .normal)
            continueButton.titleLabel?.font = .systemFont(
                ofSize: TextSize.body,
                weight: .bold
            )
            continueButton.titleLabel?.tintColor = .white
            continueButton.layer.cornerRadius = Constants.buttonCornerRadius
            continueButton.backgroundColor = Asset.Colors.primary.color
            continueButton.addTarget(
                self,
                action: #selector(onContinue),
                for: .touchUpInside
            )
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar()
    }

    private func setupUI() {
        view.backgroundColor = Asset.Colors.background.color
        title = L10n.welcome
    }

    private func bindViewModel() {

        viewModel.onContinueObservable.subscribe(onNext: { [weak self] _ in
            guard let self = self else { return }
            self.coordinator.goToScene(.seriesList, from: self)
        })
        .disposed(by: disposeBag)

    }

    @objc private func onContinue() {
        viewModel.onContinue()
    }
}
