//
//  MovieDetail.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation

struct MovieDetail: Decodable {
    
    let wrapperType: String?
    let artistType: String?
    let artistName: String?
    let artistURL: String?
    let artistID: String?
    let genreName: String?
    let mainImage: String?
    enum CodingKeys: String, CodingKey {
        
        case wrapperType = "wrapperType"
        case artistType = "artistType"
        case artistName = "artistName"
        case artistURL = "artistLinkUrl"
        case artistID = "artistId"
        case genreName = "primaryGenreName"
        case mainImage = "artworkUrl100"
    }
}
