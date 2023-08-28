//
//  MovieCell.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class MovieListCell: GenericCollectionViewCell<MovieEntity>, CellProvidable {

    typealias V = MovieEntity

    private lazy var imageView: UIImageView = .init() &> {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    private lazy var titleLabel: UILabel = .init() &> {
        $0.textColor = .white
        $0.backgroundColor = .gray
        $0.numberOfLines = 2
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 7
        self.layer.shadowRadius = 3

        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        addSubview(imageView)
        addSubview(titleLabel)

        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor)
        ])
    }

    func configure(_ item: MovieEntity) {
        titleLabel.text = item.title
        ImageManager.shared.downloadOrGetCache(url: item.posterImage, for: imageView)

        if let image = imageView.image {
            let aspectRatio = image.size.width / image.size.height
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: aspectRatio).isActive = true
        }
    }
}
