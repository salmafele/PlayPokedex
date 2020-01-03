//
//  CoreDataManager.swift
//  PlayPokedex
//
//  Created by Salma on 12/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit
import CoreData

// for favorite pokemon

class CoreDataManager {
    
    static let shared = CoreDataManager()
    let dataModelName = "PlayPokedex"
    
    // private. Therefore nothing can call it .. Singleton
    private init() {}
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var backgroundContext: NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: dataModelName)
        let description = NSPersistentStoreDescription()
        
        description.url = NSPersistentContainer.defaultDirectoryURL().appendingPathComponent(dataModelName + ".sqlite")

        // MARK: Migration
        container.persistentStoreDescriptions = [description]
        container.loadPersistentStores(completionHandler: { _, error in
            
            if let error = error {
                assertionFailure("\(error) occured")
            }
        })
        return container
    }()
    
    func saveContext(context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch {
            assertionFailure("Could not save because of: \(error)")
        }
    }
    
    func fetchObjects<T>(fetchRequest: NSFetchRequest<T>, context: NSManagedObjectContext) -> [T]{
        do {
            return try context.fetch(fetchRequest)
        } catch {
            assertionFailure("Could not fetch because of: \(error)")
        }
        return []
    } // <T> stangs for Generic
    
    func batchDelete(objects: [NSManagedObject], context: NSManagedObjectContext) {
        let objectIDs: [NSManagedObjectID] = objects.map { $0.objectID }
        let deleteRequest = NSBatchDeleteRequest(objectIDs: objectIDs)
        
        do {
            try context.execute(deleteRequest)
        } catch {
            assertionFailure("Could not delete because of: \(error)")

        }
    }
}
