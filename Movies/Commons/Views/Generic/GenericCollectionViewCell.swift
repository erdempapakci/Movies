//
//  GenericCollectionViewCell.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

 class GenericCollectionViewCell<T>: UICollectionViewCell {
    
    var item: T!
     var state: ViewState!
     
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }

}




