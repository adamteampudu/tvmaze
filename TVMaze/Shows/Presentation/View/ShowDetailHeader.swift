//
//  ShowDetailHeader.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import UIKit

class ShowDetailHeader: UITableViewHeaderFooterView {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var poster: UIImageView!

    @IBOutlet private var scheduleLabel: UILabel!
    @IBOutlet private var genresLabel: UILabel!
    @IBOutlet private var summaryLabel: UILabel! {
        didSet {
            summaryLabel.numberOfLines = 0
        }
    }

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

    func setup(with show: UiShow) {

        if let imageUrlString = show.image?.medium,
           let imageUrl = URL(string: imageUrlString) {
            poster.set(style: .networking)
            poster.setImage(from: imageUrl)
        }
        nameLabel.text = show.name

    }
    
}
