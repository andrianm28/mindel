//
//  Settings+CoreDataProperties.swift
//  mind electric
//
//  Created by M. Andrian Maulana on 06/05/21.
//
//

import Foundation
import CoreData


extension Settings {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Settings> {
        return NSFetchRequest<Settings>(entityName: "Settings")
    }

    @NSManaged public var power_capacity: Int16
    @NSManaged public var electrical_rate: Double
    @NSManaged public var bill_limit: Double
    @NSManaged public var forecasting_treshold: Double

}

extension Settings : Identifiable {

}
