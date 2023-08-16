//
//  SavedViewBuilder.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class SavedViewBuilder: BaseBuilderProtocol {
    typealias T = UIViewController
    
    static func build() -> T {
        SavedViewController()
        
    }
    
    
}
