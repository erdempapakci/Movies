//
//  MainCollectionViewAdapter.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

class MainCollectionViewAdapter: NSObject{
    
    private let presenter: MainPresenterProtocol
    private let view: MainViewProtocol
    
    init(presenter: MainPresenterProtocol, view: MainViewProtocol) {
        self.presenter = presenter
        self.view = view
        
    }
    
    func isLoading() {
      
    }

    
}
extension MainCollectionViewAdapter: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
     
        return presenter.count()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.genericdequeueReusableCell(type: iTunesListCell.self, indexPath)
        
        cell.backgroundColor = .white
        cell.configure(presenter.cellForRowAt(index: indexPath.row))
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.routeToDetail(id:  presenter.didSelectItem(indexPath.row))
    }
    
    
    

}
