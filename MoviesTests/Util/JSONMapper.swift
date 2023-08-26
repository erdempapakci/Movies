//
//  JSONMapper.swift
//  MoviesTests
//
//  Created by Erdem on 26.08.2023.
//

import Foundation

struct StaticJSONMapper {
    
    static func decode<T: Decodable>(file: String, type: T.Type) throws -> T {
       
        guard !file.isEmpty, let path = Bundle.main.path(forResource: file, ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            throw MappingError.mapError
        }
        let decoder = JSONDecoder()
        
        return try decoder.decode(T.self, from: data)
    }
    
}

extension StaticJSONMapper {
    
    enum MappingError: Error {
        case mapError
    }
    
}
