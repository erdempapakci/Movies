//
//  SavedViewInteractor.swift
//  Movies
//
//  Created by Erdem on 21.08.2023.
//

import Foundation
import CoreData

final class SavedViewInteractor: SavedViewInteractorProtocol {
    let coreService: MoviesCore

    init(coreService: MoviesCore) {
        self.coreService = coreService
    }
    func deleteSelectedDataFromCore(id: String) {
   
        coreService.deleteItem(id: id)
    }
    func deleteAllDataFromCore() {
        coreService.deleteAllBatches()
    }
    func fetchDataFromCore(comp: @escaping(Result<[MoviesMain], Error>) -> ()) {
       
            let context = PersistenceContainer.shared.viewContext
            
           
            let fetchRequest: NSFetchRequest<MoviesMain> = MoviesMain.fetchRequest()
            
            do {
                
                let movies = try context.fetch(fetchRequest)
                let validMovies = movies.filter { $0.title != nil }
                        
                        if validMovies.isEmpty {
                            comp(.failure(NSError(domain: "No valid movies found.", code: 0, userInfo: nil)))
                        } else {
                            comp(.success(validMovies))
                        }
                
            
               
            } catch {
                comp(.failure(error))

            }
      
    }
}
