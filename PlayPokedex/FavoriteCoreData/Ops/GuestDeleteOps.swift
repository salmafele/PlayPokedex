//
//  GuestDeleteOps.swift
//  PlayPokedex
//
//  Created by Salma on 12/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import CoreData

class GuestDeleteOps {
    
    private let coreDataManager = CoreDataManager.shared
    private let context = CoreDataManager.shared.mainContext
    static let shared = GuestDeleteOps()

//    func deleteAllGuests() {
//        
//        let fetchRequest: NSFetchRequest<Guest> = Guest.fetchRequest()
//        let guests = coreDataManager.fetchObjects(fetchRequest: fetchRequest, context: context)
//        if !guests.isEmpty {
//        coreDataManager.batchDelete(objects: guests, context: context)
//        }
//    }
//    
//    func deleteByusername(with username: String) {
//        let fetchRequest: NSFetchRequest<Guest> = Guest.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "username == %@", username)
//        let guests = coreDataManager.fetchObjects(fetchRequest: fetchRequest, context: context)
//    }
}
