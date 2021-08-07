//
//  ShowEpisodeViewController.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import UIKit

class ShowEpisodeViewController: BaseViewController<ShowEpisodeViewModel, ShowsCoordinator> {

    @IBOutlet private var nameLabel: UILabel! {
        didSet {
            nameLabel.font = .systemFont(ofSize: TextSize.header, weight: .bold)
        }
    }
    @IBOutlet private var numberLabel: UILabel!
    @IBOutlet private var seasonLabel: UILabel!
    @IBOutlet private var summaryLabel: UILabel! {
        didSet {
            summaryLabel.numberOfLines = 0
            summaryLabel.font = .systemFont(ofSize: TextSize.small, weight: .regular)
            summaryLabel.textColor = Asset.Colors.secondary.color
        }
    }
    @IBOutlet private var image: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        viewModel.onViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavigationBar()
    }

    private func setupUI() {
    }

    private func bindViewModel() {
        subscribe(observable: viewModel.argsObservable) { [weak self] in
            self?.title = $0.show.name
            self?.nameLabel.text = $0.episode.name
            self?.numberLabel.text = "Episode number: \($0.episode.id)"
            if let season = $0.episode.season {
                self?.seasonLabel.text = "Season: \(season)"
            } else {
                self?.seasonLabel.text = "Season: -"
            }
            self?.summaryLabel.text = $0.episode.summary?.htmlToAttributedString?.string

            if let imageUrlString = $0.episode.image?.original,
               let imageUrl = URL(string: imageUrlString) {
                self?.image.set(style: .networking)
                self?.image.setImage(from: imageUrl)
            }

        }
    }
}
