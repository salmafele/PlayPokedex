//
//  GuestSavedOps.swift
//  PlayPokedex
//
//  Created by Salma on 12/11/19.
//  Copyright © 2019 Salma. All rights reserved.
//

import UIKit
import CoreData

class GuestSavedOps {
    
    private let coreDataManager = CoreDataManager.shared
    private let context = CoreDataManager.shared.mainContext
    static let shared = GuestSavedOps()
    
    private init() {}
    
//    func saveGuest(GuestObject: GuestModel) {
//        
//        let GuestManagedObject = Guest(context: context)
//        
//        GuestManagedObject.username = GuestObject.username
//        GuestManagedObject.password = GuestObject.password
//        
//        coreDataManager.saveContext(context: context)
//        
//    }
}
