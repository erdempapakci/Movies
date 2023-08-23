//
//  MoviesContext.swift
//  Movies
//
//  Created by Erdem on 21.08.2023.
//

import Foundation
import CoreData
final class MoviesCore: BaseManagedObject<MoviesMain> {
    
    func deleteItem(id: String) {
        let fetchRequest: NSFetchRequest<MoviesMain> = MoviesMain.fetchRequest()
       
        
     fetchRequest.predicate = NSPredicate(format: "imdbID == %@", id )
           
        do {
            let matchingMovies = try PersistenceContainer.shared.viewContext.fetch(fetchRequest)
            dump(matchingMovies)
         
           if let movieToDelete = matchingMovies.first {
                PersistenceContainer.shared.viewContext.delete(movieToDelete)
                try save()
          }
        } catch {
            print("### \(#function): Failed to delete movie with ID \(id): \(error)")
        }
    }

    func create(data: SavedEntity) {
    
        do {
            
           let object = managedObject
            object.id = UUID()
            object.date = data.date
            object.genre = data.genre
            object.imdbID = data.imdbID
            object.overview = data.overview
            object.language = data.language
            object.title = data.originalTitle
            object.posterImage = data.posterImage?.jpegData(compressionQuality: 0.3)
            
            try save()
        } catch  {
            print(error.localizedDescription)
        }
    }
    func deleteAllBatches() {
        let backgroundContext = PersistenceContainer.shared.newBackgroundContext()
        
        backgroundContext.perform {
            let fetchRequest: NSFetchRequest<NSFetchRequestResult> = MoviesMain.fetchRequest()
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
            batchDeleteRequest.resultType = .resultTypeCount
            
            do {
                let batchDeleteResult = try backgroundContext.execute(batchDeleteRequest) as? NSBatchDeleteResult
                try backgroundContext.save()
                backgroundContext.reset()
                NotificationCenter.default.post(name: .refreshSaved, object: nil)
                print("### \(#function): Batch deleted post count: \(String(describing: batchDeleteResult?.result))")
            } catch {
                print("### \(#function): Failed to batch delete existing records: \(error)")
            }
         
        }
    }
    
    func readData(id: String? = nil, comp: @escaping(Result<[MoviesMain], Error>) -> ()) {
        
             let context = PersistenceContainer.shared.viewContext
             
            
             let fetchRequest: NSFetchRequest<MoviesMain> = MoviesMain.fetchRequest()
             
             do {
                 
                 let movies = try context.fetch(fetchRequest)
                 comp(.success(movies))
                 let validMovies = movies.filter { $0.title != id ?? nil }
                         
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

