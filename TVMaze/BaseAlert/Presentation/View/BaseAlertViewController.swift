//
//  BaseAlertViewController.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

class BaseAlertViewController: UIViewController {

    @IBOutlet var iconImageView: UIImageView!

    @IBOutlet var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 0
            titleLabel.textAlignment = .center
//            titleLabel.font = .systemFont(ofSize: TextSize.Bold.heading2, weight: .bold)
        }
    }

    @IBOutlet var mainButton: UIButton!
    @IBOutlet var secondaryButton: UIButton!

    private let args: BaseAlertViewContentArgs
    private let presentationType: ViewPresentationType
    private let onMainAction: (() -> Void)?
    private let onSecondaryAction: (() -> Void)?

    init(args: BaseAlertViewContentArgs,
         presentation: ViewPresentationType,
         onMainAction: (() -> Void)? = nil,
         onSecondaryAction: (() -> Void)? = nil) {
        self.args = args
        self.presentationType = presentation
        self.onMainAction = onMainAction
        self.onSecondaryAction = onSecondaryAction
        super.init(nibName: "BaseAlertViewController", bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        setupFor(args)
//        setupFor(presentationType)
    }

//    private func setupFor(_ args: BaseAlertViewContentArgs) {
//
//        self.title = args.navbarTitle
//
//        if let image = args.image {
//            iconImageView.image = image
//        } else {
//            iconImageView.isHidden = true
//        }
//
//        if let title = args.title {
//            titleLabel.text = title
//        } else {
//            titleLabel.superview?.isHidden = true
//        }
//
//        if let body = args.body {
//            bodyLabel.text = body
//            } else {
//                bodyLabel.attributedText = String.htmlAttributed(
//                    string: body,
//                    fontSize: bodyLabel.font.pointSize,
//                    textColor: bodyLabel.textColor ?? Asset.Colors.backgroundNormalState.color
//                )
//                // Forces the text alignment after setting an attributed string to the label
//                bodyLabel.textAlignment = .center
//            }
//        } else {
//            bodyLabel.superview?.isHidden = true
//        }
//
//        if let mainActionTitle = args.mainActionTitle {
//            mainButton.setTitle(mainActionTitle, for: .normal)
//            mainButton.style(like: .ghost)
//        } else {
//            mainButton.isHidden = true
//        }
//
//        if let secondaryActionTitle = args.secondaryActionTitle {
//            secondaryButton.setTitle(secondaryActionTitle, for: .normal)
//            secondaryButton.style(like: .label)
//            secondaryButton.setTitleColor(Asset.Colors.backgroundNormalState.color, for: .normal)
//        } else {
//            secondaryButton.isHidden = true
//        }
//
//        if let tertiaryActionTitle = args.tertiaryActionTitle {
//            tertiaryActionButton.setTitle(tertiaryActionTitle, for: .normal)
//            tertiaryActionButton.style(like: .label)
//            tertiaryActionButton.setTitleColor(Asset.Colors.primary.color,
//                                               for: .normal)
//        } else {
//            tertiaryActionButton.isHidden = true
//        }
//    }
//
//    private func setupFor(_ presentationType: ViewPresentationType) {
//        switch presentationType {
//        case .presentPopUp:
//            view.backgroundColor = popupBackgroundColor
//
//            //Manipulates inner imageView and labels in-between spacing to fit popup design layout
//            labelsStackView.setCustomSpacing(Dimension.REGULAR_PADDING, after: iconImageView)
//            labelsStackView.setCustomSpacing(Dimension.VERY_SMALL_PADDING, after: titleLabel)
//            containerView.layer.cornerRadius = Dimension.BIG_CORNER_RADIUS
//
//            //Manipulates containerView's constraints to make it look as a card on modal presentation
//            topLayoutConstraint.isActive = false
//            bottomLayoutConstraint.isActive = false
//            leftLayoutConstraint.constant = Dimension.DEFAULT_PADDING
//            rightLayoutConstraint.constant = Dimension.DEFAULT_PADDING
//
//            //Manipulates inner elements constraints to fit popup design layout
//            titleLabelCenterYLayoutConstraint.isActive = false
//            containerViewCenterYLayoutConstraint.isActive = true
//            iconTopLayoutConstraint.isActive = true
//            fullScreenIconAspectRatioLayoutConstraint.isActive = false
//            fullScreenIconWidthLayoutConstraint.isActive = false
//            popUpIconAspectRatioLayoutConstraint.isActive = true
//            popUpIconWidthLayoutConstraint.isActive = true
//
//            DispatchQueue.main.async { [weak self] in
//                self?.view.layoutIfNeeded()
//            }
//
//        case .presentFullScreen, .pushFullScreen:
//            labelsStackView.spacing = Dimension.bigPadding
//        }
//    }
//
//    @IBAction private func mainAction(_ sender: Any) {
//        switch presentationType {
//        case .presentPopUp, .presentFullScreen:
//            dismiss(animated: true) { [weak self] in
//                self?.onMainAction?()
//            }
//        case .pushFullScreen:
//            onMainAction?()
//        }
//    }
//
//    @IBAction private func secondaryAction(_ sender: Any) {
//        switch presentationType {
//        case .presentPopUp, .presentFullScreen:
//            dismiss(animated: true) { [weak self] in
//                self?.onSecondaryAction?()
//            }
//        case .pushFullScreen:
//            onSecondaryAction?()
//        }
//    }

}
