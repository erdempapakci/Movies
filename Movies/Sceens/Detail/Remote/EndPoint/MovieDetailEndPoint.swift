//
//  MovieDetailEndPoint.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation

enum MovieDetailEndPoint: EndPointProtocol {
    var parameter: [URLQueryItem] {

        return [
            URLQueryItem(name: "api_key", value: URLConstants.APIKey) ]
    }

    var url: URL {
        var components = URLComponents()
        components.scheme = URLConstants.scheme
        components.host = URLConstants.host
        components.path = path
        components.queryItems = parameter

        let finalURL = components.url!

                return finalURL
    }

    var path: String {
        switch self {
        case .detail(let id):

            return "/3/movie/\(id)"
        }
    }

    case detail(String)

}
