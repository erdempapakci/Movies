//
//  UITableView + Ext.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit

extension UITableView {
    
    func genericRegisterCell<T: UITableViewCell>(_ type: T.Type) {
        let cellName = String(describing: T.self)
        
        if Bundle.main.path(forResource: cellName, ofType: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: Bundle.main)
            register(nib, forCellReuseIdentifier: cellName)
        } else {
            register(type, forCellReuseIdentifier: cellName)
           
        }
  
    }
    func genericdequeueReusableCell<T: UITableViewCell>(type: T.Type, _ indexPath: IndexPath) -> T {
        let cellName = String(describing: T.self)
       
        return dequeueReusableCell(withIdentifier: cellName, for: indexPath) as! T
      
    }
    
}
