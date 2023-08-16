//
//  NetworkError.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation

enum NetworkError: Error {
    
case decodingError(description: String)
case api(description: String)
case encodingError(description: String)
case requestError(description: String)
case urlResponseCode(description: String)
    
}
