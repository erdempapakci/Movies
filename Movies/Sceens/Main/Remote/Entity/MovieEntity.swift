//
//  MovieEntity.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
struct MovieEntity: Decodable, Hashable {
    
    let vote: Int?
    let title: String?
    let posterImage: String?
    
    enum CodingKeys: String, CodingKey {
        case vote = "vote_count"
        case title = "original_title"
        case posterImage = "poster_path"
    }
    
}
