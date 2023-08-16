//
//  CustomDecoders.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation

public enum CustomDecoders {
    static let Decoder: JSONDecoder = {
       let decoder = JSONDecoder()
       
        return decoder
    }()
}
