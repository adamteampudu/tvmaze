//
//  LoaderView.swift
//
//  Created by Nicolás García on 26/11/2020.
//

import UIKit

final class LoaderView: UIView {

    private enum Constants {
        static let cornerRadius: CGFloat = 4
    }

    @IBOutlet var view: UIView!
    @IBOutlet var hudView: UIView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    private let showHudTransform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    private let hideHudTransform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    private let animationDuration = 0.3
    private let shadowOffset = CGSize(width: 1, height: 1)
    private let shadowOpacity: Float = 0.7
    private let dimColor: UIColor = Asset.Colors.primaryText.color
    private let minDimAlpha: CGFloat = 0.0
    private let maxDimAlpha: CGFloat = 0.5
    private let minHudAlpha: CGFloat = 0.0
    private let maxHudAlpha: CGFloat = 1.0
    private let hideAnimationDelay: TimeInterval = 0.0

    private lazy var dimColorWithMinAlpha: UIColor = {
        dimColor.withAlphaComponent(self.minDimAlpha)
    }()

    private lazy var dimColorWithMaxAlpha: UIColor = {
        dimColor.withAlphaComponent(self.maxDimAlpha)
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        xibSetup()
    }

    func show() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let allWindows = UIApplication.shared.windows.reversed()
            for window in allWindows where window.windowLevel == .normal {
                window.addSubview(self.view)
                self.view.frame = window.bounds
                break
            }

            self.view.backgroundColor = self.dimColorWithMinAlpha
            self.hudView.isHidden = false
            self.hudView.alpha = self.minHudAlpha
            self.hudView.transform = self.showHudTransform

            UIView.animate(withDuration: self.animationDuration,
                           animations: { [weak self] in
                            guard let self = self else { return }
                            self.view.backgroundColor = self.dimColorWithMaxAlpha
                            self.hudView.alpha = self.maxHudAlpha
                            self.hudView.transform = CGAffineTransform.identity
                           })
        }
    }

    func hide(onCompletion: @escaping() -> Void) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.backgroundColor = self.dimColorWithMaxAlpha
            UIView.animate(withDuration: self.animationDuration,
                           delay: self.hideAnimationDelay,
                           options: .curveLinear,
                           animations: { [weak self] in
                            guard let self = self else { return }
                            self.view.backgroundColor = self.dimColorWithMinAlpha
                            self.view.alpha = self.minHudAlpha
                            self.view.transform = self.hideHudTransform
                           }, completion: { [weak self] _ in
                            self?.view.removeFromSuperview()
                            onCompletion()
                           })
        }
    }
}

extension LoaderView {
    func xibSetup() {
        view = loadViewFromNib()
        addSubview(view)
        view.frame = bounds
        appearance()
    }

    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: LoaderView.self)
        let nib = UINib(nibName: String(describing: LoaderView.self), bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView else {
            fatalError("error loading LoaderView.\n\(#file)\n\(#line)")
        }
        return view
    }

    private func appearance() {
        hudView.backgroundColor = Asset.Colors.background.color
        hudView.layer.cornerRadius = Constants.cornerRadius
        hudView.layer.shadowColor = dimColor.cgColor
        hudView.layer.shadowRadius = Constants.cornerRadius
        hudView.layer.shadowOpacity = shadowOpacity
        hudView.layer.shadowOffset = shadowOffset
    }
}
