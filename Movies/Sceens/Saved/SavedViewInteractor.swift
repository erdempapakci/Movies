//
//  SavedViewInteractor.swift
//  Movies
//
//  Created by Erdem on 21.08.2023.
//

import Foundation
import CoreData

final class SavedViewInteractor: SavedViewInteractorProtocol {
    let coreAdapter = MoviesCRUD()
//    func deleteAllData() {
//        let context = PersistenceContainer.shared.viewContext
//        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = MoviesMain.fetchRequest()
//                let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//                
//                do {
//                    try context.execute(deleteRequest)
//                    try context.save()
//                } catch let error as NSError {
//                    print("Error deleting data: \(error), \(error.userInfo)")
//                }
//    }
    func deleteAllData() {
        coreAdapter.deleteAllBatches()
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
