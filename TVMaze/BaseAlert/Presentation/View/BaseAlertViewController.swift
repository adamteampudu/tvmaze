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
    }

}
