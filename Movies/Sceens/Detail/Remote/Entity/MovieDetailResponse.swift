//
//  MovieDetailResponse.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation

struct MovieDetailResponse: Decodable {
    let resultCount: Int?
    let results: [MovieDetail]?
    
    
}
