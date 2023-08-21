//
//  DetailViewInteractor.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
import Combine
final class DetailViewInteractor: DetailViewInteractorProtocol {
   
    var service: RestServiceProtocol
    let coreAdapter = MoviesCRUD()
    init(service: RestServiceProtocol) {
        self.service = service
    }
    func getDetailsWithID(_ id: String) -> AnyPublisher<MovieDetail, Error> {
        service.get(endpoint: MovieDetailEndPoint.detail(id))
    }

    func saveDataToCore(data: SavedEntity) {
        
        coreAdapter.create(data: data)
       
    }
    
}
