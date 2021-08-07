//
//  ShowDetailHeader.swift
//  TVMaze
//
//  Created by Adam Teale on 06-08-21.
//

import UIKit

protocol ShowDetailHeaderViewDelegate: AnyObject {
    func tappedMarkAsFavorite()
}

final class ShowDetailHeaderView: UIView {

    weak var delegate: ShowDetailHeaderViewDelegate?

    @IBOutlet private var nameLabel: UILabel! {
        didSet {
            nameLabel.font = .systemFont(ofSize: TextSize.title, weight: .bold)
        }
    }
    @IBOutlet private var poster: UIImageView!
    @IBOutlet private var scheduleLabel: UILabel! {
        didSet {
            scheduleLabel.numberOfLines = 0
            scheduleLabel.font = .systemFont(ofSize: TextSize.header, weight: .bold)
        }
    }
    @IBOutlet private var genresLabel: UILabel! {
        didSet {
            genresLabel.numberOfLines = 0
            genresLabel.font = .systemFont(ofSize: TextSize.small, weight: .regular)
        }
    }
    @IBOutlet private var summaryLabel: UILabel! {
        didSet {
            summaryLabel.numberOfLines = 0
            summaryLabel.font = .systemFont(ofSize: TextSize.small, weight: .regular)
            summaryLabel.textColor = Asset.Colors.secondary.color
        }
    }
    @IBOutlet private var seasonsLabel: UILabel! {
        didSet {
            seasonsLabel.font = .systemFont(ofSize: TextSize.header, weight: .bold)
            seasonsLabel.text = L10n.episodes
        }
    }
    @IBOutlet var markAsFavouriteButton: UIButton! {
        didSet {
            markAsFavouriteButton.setTitle(L10n.addToFavorites, for: .normal)
        }
    }

    class func initWithNib() -> ShowDetailHeaderView {
        let nib = UINib(nibName: String(describing: ShowDetailHeaderView.self), bundle: nil)
        return (nib.instantiate(withOwner: nil, options: nil)[0] as? ShowDetailHeaderView)!
    }

    func setup(with show: UiShow, isFavorite: Bool) {

        if let imageUrlString = show.image?.medium,
           let imageUrl = URL(string: imageUrlString) {
            poster.set(style: .networking)
            poster.setImage(from: imageUrl)
        }
        nameLabel.text = show.name
        summaryLabel.text = show.summary?.htmlToAttributedString?.string
        genresLabel.text = show.genres?.joined(separator: " | ")

        let time = show.schedule?.time ?? "-"
        let days = show.schedule?.days?.joined(separator: ", ") ?? "-"
        scheduleLabel.text = "\(time) - \(days)"

        markAsFavouriteButton.setTitle(
            isFavorite ? L10n.addToFavorites : L10n.removeFromFavorites,
            for: .normal
        )
    }

    @IBAction func markAsFavoriteTapped(_ sender: UIButton) {
        delegate?.tappedMarkAsFavorite()
    }

}
