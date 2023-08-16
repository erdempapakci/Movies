//
//  GenericValue.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation

protocol GenericValue  {
    
    associatedtype T
    var value: T { get  }
}

protocol CellProvidable {
    associatedtype V: Hashable
 
    func configure(_ item: V)
}

extension CellProvidable {
    static var reusableID: String {
        return String(describing: self)
    }
}
