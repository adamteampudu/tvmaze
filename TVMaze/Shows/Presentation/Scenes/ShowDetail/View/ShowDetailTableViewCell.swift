//
//  ShowDetailTableViewCell.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import UIKit

final class ShowDetailTableViewCell: BaseTableViewCell {

    @IBOutlet private var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    @IBOutlet private var posterView: UIImageView!

    func setup(with episode: UiEpisode) {
        if let imageUrlString = episode.image?.medium,
           let imageUrl = URL(string: imageUrlString) {
            posterView.set(style: .networking)
            posterView.setImage(from: imageUrl)
        }
        nameLabel.text = episode.name
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        posterView.image = nil
        nameLabel.attributedText = nil
    }
}
