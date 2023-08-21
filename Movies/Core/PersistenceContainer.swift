//
//  PersistenceContainer.swift
//  Movies
//
//  Created by Erdem on 19.08.2023.
//

import Foundation
import CoreData

final class PersistenceContainer: NSPersistentContainer {
   
    static let shared = PersistenceContainer(name: "MoviesCD")
    func setup() {
        
        loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
           
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })

        viewContext.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
    }
    override func newBackgroundContext() -> NSManagedObjectContext {
        let backgroundContext = super.newBackgroundContext()
        return backgroundContext
    }
}


