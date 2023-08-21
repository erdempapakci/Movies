//
//  SavedEntity.swift
//  Movies
//
//  Created by Erdem on 21.08.2023.
//

import UIKit

struct SavedEntity: Hashable{
    let originalTitle: String?
    let imdbID: String?
    let posterImage: UIImage?
    let genre: String?
    let date: String?
    let language: String?
    let overview: String?
}
