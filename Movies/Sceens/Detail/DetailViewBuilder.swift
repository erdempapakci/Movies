//
//  DetailViewBuilder.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class DetailViewBuilder: DetailViewBuilderProtocol{
    
    static func build(with ID: String) -> UIViewController {
        let view = DetailViewController()
        let interactor = DetailViewInteractor(service: app.service)
        let router = DetailViewRouter()
        let presenter = DetailViewPresenter(interactor: interactor, router: router, id: ID)
        view.presenter = presenter
        presenter.view = view
        return view
    }
    
    
  

}
