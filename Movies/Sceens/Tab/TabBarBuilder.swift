//
//  TabBarBuilder.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class TabBarBuilder: BaseBuilderProtocol {
 
    typealias T = UIViewController
    
    static func build() -> T {
      
      let tabBarVC = TabBarViewController()
        return tabBarVC
    }
    
 
    
}

