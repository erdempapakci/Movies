//
//  Decoder.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
import Combine

public class Decoder {

    func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, NetworkError> {
        let decoder = CustomDecoders.Decoder

        return Just(data)
            .decode(type: T.self, decoder: decoder)
            .mapError({.decodingError(description: $0.localizedDescription)})
            .eraseToAnyPublisher()
    }

}
