//
//  ShowDetailSectionHeaderView.swift
//  TVMaze
//
//  Created by Adam Teale on 07-08-21.
//

import UIKit

class ShowDetailSectionHeaderView: UITableViewHeaderFooterView {

    private enum Constants {
        static let padding: CGFloat = 20
        static let numberOfLines: Int = 0
    }

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: TextSize.header, weight: .regular)
        label.textColor = Asset.Colors.primaryText.color
        label.numberOfLines = Constants.numberOfLines
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupUI() {
//        contentView.backgroundColor = .clear
        backgroundView = UIView()
        backgroundView?.backgroundColor = Asset.Colors.primary.color

        contentView.addSubview(titleLabel)

        let titleConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                constant: Constants.padding),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                 constant: Constants.padding),
            titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor)
        ]

        NSLayoutConstraint.activate(titleConstraints)
    }

    override func prepareForReuse() {
        titleLabel.text = nil
    }

    func set(title: String) {
        titleLabel.text = title
    }
}
