//
//  SavedViewAdapter.swift
//  Movies
//
//  Created by Erdem on 21.08.2023.
//

import UIKit

final class SavedViewAdapter: NSObject{
    private let presenter: SavedPresenterProtocol
    private let view: SavedViewControllerProtocol
    init(presenter: SavedPresenterProtocol, view: SavedViewControllerProtocol) {
        self.presenter = presenter
        self.view = view
    }
}
extension SavedViewAdapter: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(presenter.numberOfRow())
        return presenter.numberOfRow()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.genericdequeueReusableCell(type: SavedTableViewCell.self, indexPath)
        cell.configure(presenter.cellForRowAt(at: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Saved Movies"
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
   
    
    
}
