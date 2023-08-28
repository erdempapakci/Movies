//
//  UIErrors.swift
//  Movies
//
//  Created by Erdem on 18.08.2023.
//

import Foundation

enum UIErrors: String, Error {
    case emptyIMDBID = "Could not find link :( :("
    var localizedDescription: String {
            return rawValue
        }

}
