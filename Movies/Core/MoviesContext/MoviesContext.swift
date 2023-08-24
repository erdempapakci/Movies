//
//  MoviesContext.swift
//  Movies
//
//  Created by Erdem on 21.08.2023.
//

import Foundation
import CoreData
final class MoviesCore: BaseManagedObject<MoviesMain> {
    
    func deleteItem(id: Int) {
        let fetchRequest: NSFetchRequest<MoviesMain> = MoviesMain.fetchRequest()
        let idNumber = NSNumber(value: id)
        
     fetchRequest.predicate = NSPredicate(format: "id == %@", idNumber )
           
        do {
            let matchingMovies = try PersistenceContainer.shared.viewContext.fetch(fetchRequest)
           
         
           if let movieToDelete = matchingMovies.first {
                PersistenceContainer.shared.viewContext.delete(movieToDelete)
               NotificationCenter.default.post(name: .refreshButtonState, object: nil)
               NotificationCenter.default.post(name: .refreshSaved, object: nil)
                
          }
            try save()
        } catch {
            print("### \(#function): Failed to delete movie with ID \(id): \(error)")
        }
    }

    func create(data: SavedEntity) {
    
        do {
            guard let id = data.id else {return}
           let object = createObject()
            object.id =  Int32(Int(truncatingIfNeeded: id))
            object.date = data.date
            object.genre = data.genre
            object.imdbID = data.imdbID
            object.overview = data.overview
            object.language = data.language
            object.title = data.originalTitle
            object.posterImage = data.posterImage?.jpegData(compressionQuality: 0.3)
            NotificationCenter.default.post(name: .refreshSaved, object: nil)
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
                NotificationCenter.default.post(name: .refreshButtonState, object: nil)
                NotificationCenter.default.post(name: .refreshSaved, object: nil)
                print("### \(#function): Batch deleted post count: \(String(describing: batchDeleteResult?.result))")
            } catch {
                print("### \(#function): Failed to batch delete existing records: \(error)")
            }
         
        }
    }
    
    func readData(id: Int? = nil, comp: @escaping(Result<[MoviesMain], Error>) -> ()) {
        
             let context = PersistenceContainer.shared.viewContext
             
            
             let fetchRequest: NSFetchRequest<MoviesMain> = MoviesMain.fetchRequest()
            fetchRequest.returnsObjectsAsFaults = false
            
             do {
                 
                 let movies = try context.fetch(fetchRequest)
             
                 if let id = id {
                     let validMovies = movies.filter { $0.id == Int32(id)   }
                     comp(.success(validMovies))
                 } else {
                    
                    let valids = movies.filter({ $0.title != nil })
                     dump(valids)
                     comp(.success(valids))
                 }
       
             } catch {
                 comp(.failure(error))

             }

    }

}

