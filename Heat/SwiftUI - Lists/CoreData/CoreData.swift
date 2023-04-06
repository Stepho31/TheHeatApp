//
//  CoreData.swift
//  
//
//  Created by Stephen on 6/23/22.
//

import Foundation
import SwiftUI

@main
struct CoreDataExample_SwiftUI: App {
    
    let persistenceController = PersistanceController.shared
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
                
            case .background:
                print("Scene is in background")
                persistenceController.save()
            case .inactive:
                print("Scene is inactive")
            case .active:
                print("Scene is active")
            @unknown default:
                print("Scene is in background")
            }
        }
    }
}
