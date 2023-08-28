//
//  Movies+CoreDataProperties.swift
//  
//
//  Created by Erdem on 18.08.2023.
//
//

import Foundation
import CoreData

extension Movies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movies> {
        return NSFetchRequest<Movies>(entityName: "Movies")
    }

    @NSManaged public var backgroundImage: UUID?
    @NSManaged public var originalTitle: String?
    @NSManaged public var imdbID: String?
    @NSManaged public var category: String?
    @NSManaged public var genre: String?
    @NSManaged public var date: String?
    @NSManaged public var language: String?
    @NSManaged public var overview: String?

}
