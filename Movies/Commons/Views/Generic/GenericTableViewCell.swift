//
//  GenericTableViewCell.swift
//  Movies
//
//  Created by Erdem on 18.08.2023.
//

import UIKit

class GenericTableViewCell<T>: UITableViewCell {

   var item: T!

   override func layoutSubviews() {
       super.layoutSubviews()
       configureSubViews()
   }
    func configureSubViews() {

    }

}
