//
//  MainViewBuilder.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit


final class MainViewBuilder: BaseBuilderProtocol{
    typealias T = UIViewController
    
    static func build() -> T {
      
        let view = MainViewController()
        let interactor = MainInteractor(service: app.service)
        let router = MainRouter()
        let presenter = MainPresenter(view: view, interactor: interactor, router: router)
        let adapter = MainCollectionViewAdapter(presenter: presenter, view: view)
        
        view.presenter = presenter
        view.presenter.delegate = view
        view.adapter = adapter
        router.view = view
        return view
    }
}


