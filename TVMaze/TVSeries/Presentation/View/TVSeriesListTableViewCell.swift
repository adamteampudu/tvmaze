//
//  TVSeriesListTableViewCell.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

final class TVSeriesListTableViewCell: BaseTableViewCell {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var posterView: UIImageView!

    func setup(with tvSeries: UiShow) {
        if let imageUrlString = tvSeries.image?.medium,
           let imageUrl = URL(string: imageUrlString) {
            posterView.set(style: .networking)
            posterView.setImage(from: imageUrl)
        }
        nameLabel.text = tvSeries.name
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        posterView.image = nil
        nameLabel.attributedText = nil
    }
}
