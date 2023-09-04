//
//  PersistentStorage.swift
//  iOSCoreData-Part1
//
//  Created by Chandra Jayaswal on 04/09/2023.
//

import Foundation
import CoreData

final class PersistentStorage {
    
    private init () {
        
    }
    
    static let shared = PersistentStorage()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreData")
        container.loadPersistentStores { (description:NSPersistentStoreDescription, error: Error?) in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? persistentContainer.viewContext
        guard context.hasChanges else {
            return
        }
        do {
            try context.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
}
