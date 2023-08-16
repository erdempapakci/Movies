//
//  MovieListEndPoint.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation

fileprivate let baseURL = URL(string: "https://api.themoviedb.org/3/")!
fileprivate let APIKey =  "a37acca46f3dacc202fe88e6d3bb4258"


enum MovieListEndPoint: EndPointProtocol, LogProvidable {
    var parameter: [URLQueryItem] {
        switch self {
        case .search(let query, let page):
            
            return [
                URLQueryItem(name: "api_key", value: APIKey),
                URLQueryItem(name: "query", value: query),
                URLQueryItem(name: "page", value: "\(page)")
            ]
        }
    }
    
    
    
    var url: URL {
     
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.path = path
        components.queryItems = parameter
        
        let finalURL = components.url!
        
                return finalURL
    }
    
    var path: String {
        switch self {
        case .search(_):
            return "/3/search/movie"
        }
    }
  
   
    case search(String, Int)
}
