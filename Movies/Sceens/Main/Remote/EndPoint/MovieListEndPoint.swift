//
//  MovieListEndPoint.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation



enum MovieListEndPoint: EndPointProtocol, LogProvidable {
    var parameter: [URLQueryItem] {
        switch self {
        case .search(let query, let page):
            
            return [
                URLQueryItem(name: "api_key", value: URLConstants.APIKey),
                URLQueryItem(name: "query", value: query),
                URLQueryItem(name: "page", value: "\(page)")
            ]
        }
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
        case .search:
            return "/3/search/movie"
        }
    }
  
   
    case search(String, Int)
}
