//
//  SavedViewController.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

final class SavedViewController: BaseViewController<SavedViewPresenter>{
    private lazy var tableCellComponent: SavedTableViewComponent = .init() &> {
        $0.backgroundColor = .red
    }
   
    override func configureViewDidLoad() {
        super.configureViewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(tableCellComponent
        )
    }
}
