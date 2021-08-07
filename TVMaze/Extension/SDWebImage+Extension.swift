//
//  UIImageViewExtension.swift
//
//  Created by Nicolás García on 02/03/2021.
//

import UIKit
import SDWebImage

extension UIImageView {

    enum Style {
        case networking
    }

    func setImage(from URL: URL) {
        self.sd_setImage(with: URL,
                         placeholderImage: nil,
                         options: [.continueInBackground, .highPriority],
                         completed: nil)
    }

    func set(style: Style) {
        switch style {
        case .networking:
            sd_imageIndicator = SDWebImageActivityIndicator.gray
            sd_imageTransition = SDWebImageTransition.fade
        }
    }
}
