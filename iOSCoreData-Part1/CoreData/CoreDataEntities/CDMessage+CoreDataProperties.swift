//
//  CDMessage+CoreDataProperties.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 08/09/2023.
//
//

import Foundation
import CoreData


extension CDMessage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMessage> {
        return NSFetchRequest<CDMessage>(entityName: "CDMessage")
    }

    @NSManaged public var body: String?
    @NSManaged public var messageId: String?
    @NSManaged public var receiver: String?
    @NSManaged public var sender: String?
    @NSManaged public var timestamp: Date?
    @NSManaged public var title: String?
    @NSManaged public var status: Int64

}

extension CDMessage : Identifiable {

}
