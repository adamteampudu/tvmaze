//
//  PeopleListTableViewCell.swift
//  TVMaze
//
//  Created by Adam Teale on 04-08-21.
//

import UIKit

final class PeopleListTableViewCell: BaseTableViewCell {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var posterView: UIImageView!

    func setup(with person: UiPerson) {
        if let imageUrlString = person.image?.medium,
           let imageUrl = URL(string: imageUrlString) {
            posterView.set(style: .networking)
            posterView.setImage(from: imageUrl)
        }
        nameLabel.text = person.name
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        posterView.image = nil
        nameLabel.attributedText = nil
    }
}
