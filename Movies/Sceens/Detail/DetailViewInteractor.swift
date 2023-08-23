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
    let coreAdapter = MoviesCore()
    init(service: RestServiceProtocol) {
        self.service = service
    }
    func getDetailsWithID(_ id: String) -> AnyPublisher<MovieDetail, Error> {
        service.get(endpoint: MovieDetailEndPoint.detail(id))
    }

    func handleCreateDelete(type: CoreCRUD) {
        switch type {
        case .create(let data):
            coreAdapter.create(data: data)
        case .deleteSelected(let id):
            coreAdapter.deleteItem(id: id)
        case .deleteAll:
            break
        }
      
    }
    func fetchDataFromCore(id: String, comp: @escaping(Result<[MoviesMain], Error>) -> ()) {
       
        coreAdapter.readData(comp: comp)
      
    }
    
}
enum CoreCRUD {
    case create(SavedEntity)
    case deleteSelected(String)
    case deleteAll
}
