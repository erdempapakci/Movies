//
//  MovieDetail.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation

struct MovieDetail: Decodable {
    let adult: Bool?
    let backdropPath: String?
    let budget: Int?
    let homepage: String?
    let id: Int?
    let originalTitle: String?
    let imdbID: String?
    let overview: String?
    let originalLanguage: String?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case adult, budget, homepage, id, overview
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case posterPath = "poster_path"
    }
}
