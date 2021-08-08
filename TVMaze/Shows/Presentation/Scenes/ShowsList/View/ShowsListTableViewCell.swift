//
//  ShowsListTableViewCell.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

final class ShowsListTableViewCell: BaseTableViewCell {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var posterView: UIImageView!
    @IBOutlet private var isFavoriteLabel: UILabel!

    func setup(with show: UiShow) {
        if let imageUrlString = show.image?.medium,
           let imageUrl = URL(string: imageUrlString) {
            posterView.set(style: .networking)
            posterView.setImage(from: imageUrl)
        }
        nameLabel.text = show.name
        isFavoriteLabel.text = show.isFavorite ? "⭐" : ""
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        posterView.image = nil
        nameLabel.attributedText = nil
        isFavoriteLabel.attributedText = nil
    }
}
