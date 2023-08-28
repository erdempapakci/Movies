//
//  UIStoryboard + Ext.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import UIKit
// swiftlint:disable force_cast
extension UIStoryboard {

    func genericInstantiateViewController<T>(ofType: T.Type, with identifier: String?) -> T where T: UIViewController {
        guard let identifier = identifier else {fatalError("Controller ID was not found")}

        return instantiateViewController(withIdentifier: identifier) as! T
    }
}
// swiftlint:enable force_cast
