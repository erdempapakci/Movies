//
//  MovieDetailEndPoint.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
fileprivate let baseURL = URL(string: "https://itunes.apple.com")

enum MovieDetailEndPoint {
    var url: URL {
        guard let urlAllowedPath = path.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {return baseURL!}
        let url = URL(string: urlAllowedPath, relativeTo: baseURL)
       
        return url!
    }
    
    var path: String {
        switch self {
        case .detail(let id):
            
            return "/lookup?id=\(id)"
        }
    }
    
    case detail(String)
    
}
