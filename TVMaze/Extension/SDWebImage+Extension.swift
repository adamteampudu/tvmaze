//
//  SDWebImage+Extension.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit
import SDWebImage

extension UIImageView {

    func setImage(from URL: URL) {
        self.sd_setImage(with: URL,
                         placeholderImage: nil,
                         options: [.continueInBackground, .highPriority],
                         completed: nil)
    }

}
