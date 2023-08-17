//
//  MainCollectionViewAdapter.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

class MainCollectionViewAdapter: NSObject, UIGestureRecognizerDelegate{
    
    private let presenter: MainPresenterProtocol
    private let view: MainViewProtocol
    
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
        
        cell.backgroundColor = .white
        cell.configure(presenter.cellForRowAt(index: indexPath.row))
      
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        presenter.routeToDetail(id:  presenter.didSelectItem(indexPath.row))
    }
    
    
    

}
