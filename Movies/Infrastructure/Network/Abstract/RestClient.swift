//
//  RestClient.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
import Combine

protocol RestServiceProtocol {

    func get<T: Decodable, S: EndPointProtocol>(endpoint: S) -> AnyPublisher<T, Error>

}
