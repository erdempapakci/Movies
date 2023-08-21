//
//  MoviesContext.swift
//  Movies
//
//  Created by Erdem on 21.08.2023.
//

import Foundation
import CoreData
final class MoviesCRUD: BaseManagedObject<MoviesMain> {
    
    func create(data: SavedEntity) {
       
        managedObject.date = data.date
        managedObject.genre = data.genre
        managedObject.imdbID = data.imdbID
        managedObject.overview = data.overview
        managedObject.language = data.language
        managedObject.title = data.originalTitle
        managedObject.posterImage = data.posterImage?.jpegData(compressionQuality: 0.3)
       
        do {
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


}

