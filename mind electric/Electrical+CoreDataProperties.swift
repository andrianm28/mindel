//
//  Electrical+CoreDataProperties.swift
//  mind electric
//
//  Created by M. Andrian Maulana on 06/05/21.
//
//

import Foundation
import CoreData


extension Electrical {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Electrical> {
        return NSFetchRequest<Electrical>(entityName: "Electrical")
    }

    @NSManaged public var energy: Float
    @NSManaged public var power: Float
    @NSManaged public var current: Float
    @NSManaged public var powerfactor: Float
    @NSManaged public var voltage: Float
    @NSManaged public var id: String?
    @NSManaged public var created_at: Date?

}

extension Electrical : Identifiable {

}
