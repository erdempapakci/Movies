//
//  BaseManagedObject.swift
//  Movies
//
//  Created by Erdem on 21.08.2023.
//

import Foundation
import CoreData

class BaseManagedObject<T: NSManagedObject> {
    func createObject() -> T {
        return T(context: PersistenceContainer.shared.viewContext)
    }
    
    func save() throws {
        try PersistenceContainer.shared.viewContext.save()
    }
}
