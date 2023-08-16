//
//  MovieEntity.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
struct MovieEntity: Decodable, Hashable {
    let adult: Bool?
    let id: Int?
    let vote: Int?
    let title: String?
    let posterImage: String?
    let overview: String?
    let releaseDate: String?
    enum CodingKeys: String, CodingKey {
        case adult, id, overview
        
        case vote = "vote_count"
        case title = "original_title"
        case posterImage = "poster_path"
        case releaseDate = "release_date"
    }
    
}
