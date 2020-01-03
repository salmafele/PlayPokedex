//
//  GuestFetchOps.swift
//  PlayPokedex
//
//  Created by Salma on 12/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit
import CoreData

class GuestFetchOps {
    
    private let coreDataManager = CoreDataManager.shared
    private let context = CoreDataManager.shared.mainContext
    static let shared = GuestFetchOps()
    
    // make it Singleton
    private init() {}
//
//    func getAllGuests() -> [Guest] {
//        let fetchRequest: NSFetchRequest<Guest> = Guest.fetchRequest()
//        return coreDataManager.fetchObjects(fetchRequest: fetchRequest, context: context)
//    }
//
//    func getGuestBy(username: String) -> [Guest] {
//        let fetchRequest: NSFetchRequest<Guest> = Guest.fetchRequest()
//        fetchRequest.predicate = NSPredicate(format: "username=%@", username)
//
//        return coreDataManager.fetchObjects(fetchRequest: fetchRequest, context: context)
//
//    }
}
