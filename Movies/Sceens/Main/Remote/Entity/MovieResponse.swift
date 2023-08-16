//
//  MovieResponse.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation

struct MovieResponse: Decodable {
    let page: Int?
   
    let results: [MovieEntity]?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
    }
}
