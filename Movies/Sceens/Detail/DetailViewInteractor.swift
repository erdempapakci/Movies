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
    let coreService = MoviesCore()
    init(service: RestServiceProtocol) {
        self.service = service
    }
    func getDetailsWithID(_ id: String) -> AnyPublisher<MovieDetail, Error> {
        service.get(endpoint: MovieDetailEndPoint.detail(id))
    }

    func handleCreateDelete(type: CoreCRUD) {
        switch type {
        case .create(let data):
            coreService.create(data: data)
        case .deleteSelected(let id):
            coreService.deleteItem(id: id)
        case .deleteAll:
            break
        }
      
    }
    func fetchDataFromCore(id: Int, comp: @escaping(Result<[MoviesMain], Error>) -> ()) {
       
        coreService.readData(id: id, comp: comp)
        
    }
    
}
