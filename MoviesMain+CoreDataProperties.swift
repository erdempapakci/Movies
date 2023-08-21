//
//  MoviesMain+CoreDataProperties.swift
//  Movies
//
//  Created by Erdem on 21.08.2023.
//
//

import Foundation
import CoreData


extension MoviesMain {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoviesMain> {
        return NSFetchRequest<MoviesMain>(entityName: "MoviesMain")
    }

    @NSManaged public var title: String?
    @NSManaged public var imdbID: String?
    @NSManaged public var posterImage: Data?
    @NSManaged public var genre: String?
    @NSManaged public var date: String?
    @NSManaged public var language: String?
    @NSManaged public var overview: String?

}

extension MoviesMain : Identifiable {

}
