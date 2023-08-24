//
//  CRUDType.swift
//  Movies
//
//  Created by Erdem on 23.08.2023.
//

import Foundation

enum CoreCRUD {
    case create(SavedEntity)
    case deleteSelected(Int)
    case deleteAll
}
