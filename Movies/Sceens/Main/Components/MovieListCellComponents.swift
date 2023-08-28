//
//  MovieListCellComponents.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

class MovieListCellComponents: BaseCollectionView<MovieListCell, MovieEntity> {

    var adapter: MainCollectionViewAdapter

    init(adapter: MainCollectionViewAdapter) {
        self.adapter = adapter
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private lazy var flowLayout: UICollectionViewFlowLayout = .init() &> {
        $0.itemSize = CGSize(width: frame.width  / 2 - 80, height: 150 )
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 10
        $0.minimumInteritemSpacing = 10
        $0.sectionInset = .init(top: 10, left: 10, bottom: 10, right: 10)
    }

    lazy var collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: flowLayout) &> {

        $0.genericRegister(MovieListCell.self)

        $0.dataSource = adapter
        $0.delegate = adapter
        $0.translatesAutoresizingMaskIntoConstraints = false

    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configureCollectionView()

    }

    func configureCollectionView() {
        addSubview(collectionView)

        NSLayoutConstraint.activate([

            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])
    }

}
