//
//  CoreDataManager.swift
//  PhonePe
//
//  Created by Ravi Ranjan on 11/05/24.
//

import Foundation
import CoreData
class CoreDataManager {
    
    let persitanceContaner: NSPersistentContainer
    
    static let shared = CoreDataManager()
    
    // You can't create manger instance by initilizing it
    private init() {
        persitanceContaner = NSPersistentContainer.init(name: "PhonePeModel")
        persitanceContaner.loadPersistentStores { (storeDescription, error )in
            if let error = error {
                fatalError("Failed to initilize core data with Data Model \(error.localizedDescription)")
            }
        }
    }

    func getAllMovies() -> [VenueDB] {
        
        //Strongly typed as we say the request for fetch is of Movie entity
        let fetchRequest: NSFetchRequest<VenueDB> = VenueDB.fetchRequest()
        do {
            return try persitanceContaner.viewContext.fetch(fetchRequest)
        } catch {
            print("There is no Data in Entity")
            return []
        }

    }
    
    // save data to persistance container [CORE DATA ENTITY]
    func save(){
        do {
            try persitanceContaner.viewContext.save()
        } catch {
            persitanceContaner.viewContext.rollback()
            print("failed to save the data \(error)")
        }
    }
    
   
}
