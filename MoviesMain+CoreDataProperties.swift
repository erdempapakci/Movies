//
//  MoviesMain+CoreDataProperties.swift
//  Movies
//
//  Created by Erdem on 24.08.2023.
//
//

import Foundation
import CoreData


extension MoviesMain {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviesMain> {
        return NSFetchRequest<MoviesMain>(entityName: "MoviesMain")
    }

    @NSManaged public var date: String?
    @NSManaged public var genre: String?
    @NSManaged public var id: Int32
    @NSManaged public var imdbID: String?
    @NSManaged public var language: String?
    @NSManaged public var overview: String?
    @NSManaged public var posterImage: Data?
    @NSManaged public var title: String?

}

extension MoviesMain : Identifiable {

}
