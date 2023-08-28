//
//  MainCollectionViewAdapter.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

class MainCollectionViewAdapter: NSObject, UIGestureRecognizerDelegate {

    private let presenter: MainPresenterProtocol
    private let view: MainViewProtocol

    let animationDuration: Double = 0.3
    let delayBase: Double = 0.3

    init(presenter: MainPresenterProtocol, view: MainViewProtocol) {
        self.presenter = presenter
        self.view = view

    }

}
extension MainCollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return presenter.count()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.genericdequeueReusableCell(type: MovieListCell.self, indexPath)
        cell.alpha = 0
        cell.backgroundColor = .white

        cell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

        let column = Double(cell.frame.minX / cell.frame.width)
        let row = Double(cell.frame.minY / cell.frame.height)
        let distance = sqrt(pow(column, 2) + pow(row, 2))
        let delay = sqrt(distance) * delayBase
        UIView.animate(withDuration: animationDuration, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: [], animations: { [weak self] in

            guard let self = self else {return}
          cell.alpha = 1
          cell.transform = .identity
            cell.configure(self.presenter.cellForRowAt(index: indexPath.row))
        })

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        presenter.routeToDetail(id: presenter.didSelectItem(indexPath.row))
    }

}
