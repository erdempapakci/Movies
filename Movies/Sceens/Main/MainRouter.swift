//
//  MainRouter.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class MainRouter: MainRouterProtocol {

    weak var view: UIViewController?

    func routeToDetail(id: String) {
        let detailViewController = DetailViewBuilder.build(with: id)

        view?.navigationController?.pushViewController(detailViewController, animated: true)
    }

}
