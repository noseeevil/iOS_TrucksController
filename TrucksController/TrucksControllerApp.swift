//
//  TrucksControllerApp.swift
//  TrucksController
//
//  Created by noseeevil on 04.05.2022.
//

import SwiftUI

@main
struct TrucksControllerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
