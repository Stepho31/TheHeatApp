//
//  PersistanceController.swift
//  SwiftUI - Lists
//
//  Created by Stephen on 6/23/22.
//
//
//import Foundation
//import CoreData
//
//struct PersistanceController {
//    
//    static let shared = PersistanceController()
//    
//    let container: NSPersistentContainer
//    
//    init() {
//        container = NSPersistentContainer(name:"DataHandler")
//        container.loadPersistentStores { (description, error) in
//            if let error = error {
//                fatalError("Error: \(error.localizedDescription)")
//            }
//        }
//    }
//    func save(name: String) {
//        let request: NSFetchRequest<Favorites> = Favorites.fetchRequest()
//        let context = container.viewContext
//        
//        request.predicate = NSPredicate(format: "name like %@", name)
//        request.includesPropertyValues = false
//        let objects = try! context.fetch(request)
//        
//        for hold in objects {
//            context.save(hold)
//        }
//
//        if context.hasChanges{
//            do{
//                try context.delete()
//            }
//            catch{
//                print(error)
//            }
//        }
//    }
//    func delete(name: String) {
//        let request: NSFetchRequest<Favorites> = Favorites.fetchRequest()
//        let context = container.viewContext
//        
//        request.predicate = NSPredicate(format: "name like %@", name)
//        request.includesPropertyValues = false
//        let objects = try! context.fetch(request)
//        
//        for hold in objects {
//            context.delete(hold)
//        }
//
//        if context.hasChanges{
//            do{
//                try context.save()
//            }
//            catch{
//                print(error)
//            }
//        }
//    }
//}

