//
//  BaseCollectionView.swift
//  Movies
//
//  Created by Erdem on 18.08.2023.
//

import UIKit

class BaseCollectionView<T: GenericCollectionViewCell<U> & CellProvidable, U>: UIView { }

class BaseTableView<T: GenericTableViewCell<U> & CellProvidable, U>: UIView {
}
