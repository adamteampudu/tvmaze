//
//  PersonDetailHeader.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import UIKit

final class PersonDetailHeaderView: UIView {

    @IBOutlet private var nameLabel: UILabel! {
        didSet {
            nameLabel.font = .systemFont(ofSize: TextSize.title, weight: .bold)
        }
    }
    @IBOutlet private var imageView: UIImageView!

    class func initWithNib() -> PersonDetailHeaderView {
        let nib = UINib(nibName: String(describing: PersonDetailHeaderView.self), bundle: nil)
        return (nib.instantiate(withOwner: nil, options: nil)[0] as? PersonDetailHeaderView)!
    }

    func setup(with Person: UiPerson) {

        if let imageUrlString = Person.image?.medium,
           let imageUrl = URL(string: imageUrlString) {
            imageView.set(style: .networking)
            imageView.setImage(from: imageUrl)
        }
        nameLabel.text = Person.name
    }

}
