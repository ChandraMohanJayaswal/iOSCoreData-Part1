//
//  CDMessage+CoreDataProperties.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 05/09/2023.
//
//

import Foundation
import CoreData


extension CDMessage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMessage> {
        return NSFetchRequest<CDMessage>(entityName: "CDMessage")
    }

    @NSManaged public var messageId: String?
    @NSManaged public var sender: String?
    @NSManaged public var receiver: String?
    @NSManaged public var title: String?
    @NSManaged public var body: String?
    @NSManaged public var timestamp: Date?

}

extension CDMessage : Identifiable {

}
