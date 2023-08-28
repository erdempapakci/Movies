//
//  TabBarItem.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

enum TabBarItem: Int {

    case search, saved

    var title: String {
        switch self {
        case .search: return  "Search"

        case .saved: return  "Saved"

        }
    }

    var icons: UIImage {

        switch self {

        case .search: return .searchImage

        case .saved: return .savedImage

        }
    }
    var viewControllers: UIViewController {

        switch self {
        case .search: return MainViewBuilder.build()

        case .saved: return SavedViewBuilder.build()

        }

    }

}

extension UIImage {
    static let searchImage = UIImage(systemName: "magnifyingglass.circle")!
    static let savedImage = UIImage(systemName: "star.square")!
}
