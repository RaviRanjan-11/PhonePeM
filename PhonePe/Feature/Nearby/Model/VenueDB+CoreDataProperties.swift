//
//  VenueDB+CoreDataProperties.swift
//  PhonePe
//
//  Created by Ravi Ranjan on 11/05/24.
//
//

import Foundation
import CoreData


extension VenueDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<VenueDB> {
        return NSFetchRequest<VenueDB>(entityName: "VenueDB")
    }

    @NSManaged public var name: String?
    @NSManaged public var city: String?
    @NSManaged public var address: String?

}

extension VenueDB : Identifiable {

}
