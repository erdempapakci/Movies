//
//  EndPointProtocol.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation

protocol EndPointProtocol {
    var url: URL {get}
    var path: String {get}
    var parameter: [URLQueryItem] {get}
}
