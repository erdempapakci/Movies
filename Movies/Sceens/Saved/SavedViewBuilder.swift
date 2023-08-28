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
    let view = SavedViewController()
        let interactor = SavedViewInteractor(coreService: app.coreService)
    let presenter = SavedViewPresenter(interactor: interactor, view: view)
        let adapter = SavedViewAdapter(presenter: presenter, view: view)
        view.presenter = presenter
        view.adapter = adapter

        return view
    }

}
