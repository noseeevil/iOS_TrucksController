//
//  TrucksControllerApp.swift
//  TrucksController
//
//  Created by noseeevil on 04.05.2022.
//

import SwiftUI

@main
struct TrucksControllerApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
