//
//  MainInteractor.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
import Combine


final class MainInteractor: MainInteractorProtocol {

    let service: RestServiceProtocol
    
    init(service: RestServiceProtocol) {
        self.service = service
    }
    
    func getListOfQuery(query: String) -> AnyPublisher<MovieResponse, Error> {
       
        service.get(endpoint: MovieListEndPoint.search(query, 1))
      
    }
    
    
}
