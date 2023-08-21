//
//  SavedTableViewComponent.swift
//  Movies
//
//  Created by Erdem on 18.08.2023.
//

import UIKit
import CoreData

final class SavedTableViewComponent: BaseTableView<SavedTableViewCell, SavedEntity> {
    var adapter: SavedViewAdapter
    
    init(adapter: SavedViewAdapter) {
        self.adapter = adapter
  
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     lazy var tableView: UITableView = .init() &> {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.genericRegisterCell(SavedTableViewCell.self)
        $0.dataSource = adapter
        $0.delegate = adapter
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        configureTableView()
    }
    private func configureTableView() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
}



