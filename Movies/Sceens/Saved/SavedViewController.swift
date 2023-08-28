//
//  SavedViewController.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit
import CoreData

final class SavedViewController: BaseViewController<SavedViewPresenter> {

    private lazy var savedTableViewComponent: SavedTableViewComponent = .init(adapter: adapter) &> {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var adapter: SavedViewAdapter!

    private lazy var deleteButton: UIBarButtonItem = .init() &> {
        $0.title = "Delete All"
        $0.tintColor = .red
        $0.target = self
        $0.action = #selector(deleteButtonTapped)
    }
    @objc private func deleteButtonTapped() {
        presenter.deleteAll()

    }
    @objc private func reloadSaved() {
        presenter.viewDidload()
    }

    override func configureViewDidLoad() {
        super.configureViewDidLoad()
        configureComponents()
        presenter.viewDidload()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItems = [ deleteButton]
    }

    func reloadData() {
        DispatchQueue.main.async {
            self.savedTableViewComponent.tableView.reloadData()
        }

    }
    private func configureComponents() {
        view.addSubview(savedTableViewComponent)
        NSLayoutConstraint.activate([

            savedTableViewComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            savedTableViewComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            savedTableViewComponent.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            savedTableViewComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension SavedViewController: SavedViewControllerProtocol {

}
