//
//  UICollectionView + Ext.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

extension UICollectionView {
    
    func genericRegister<T: UICollectionViewCell>(_ type: T.Type) {
        let cellName = String(describing: type)
        
        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: Bundle.main)
            register(nib, forCellWithReuseIdentifier: cellName)
            
        }
        register(type, forCellWithReuseIdentifier: cellName)
    }
    
    func genericdequeueReusableCell<T: UICollectionViewCell>(type: T.Type, _ indexPath: IndexPath) -> T {
        let cellName = String(describing: T.self)
        
        return dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as! T
    }
    
    
}
