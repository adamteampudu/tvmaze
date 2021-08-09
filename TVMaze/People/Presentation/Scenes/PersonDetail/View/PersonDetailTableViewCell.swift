//
//  PersonDetailTableViewCell.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import UIKit

final class PersonDetailTableViewCell: BaseTableViewCell {

    @IBOutlet private var nameLabel: UILabel! {
        didSet {
            nameLabel.numberOfLines = 0
        }
    }
    @IBOutlet private var posterView: UIImageView!

    func setup(with crew: UiCrew) {
        nameLabel.text = crew.embedded?.show?.name
        setPosterImage(urlString: crew.embedded?.show?.image?.medium)
    }

    func setup(with cast: UiCast) {
        nameLabel.text = cast.embedded?.show?.name
        setPosterImage(urlString: cast.embedded?.show?.image?.medium)
    }

    func setPosterImage(urlString: String?) {
        if let posterUrlString = urlString,
           let posterUrl = URL(string: posterUrlString) {
            posterView.set(style: .networking)
            posterView.setImage(from: posterUrl)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        posterView.image = nil
        nameLabel.attributedText = nil
    }
}
