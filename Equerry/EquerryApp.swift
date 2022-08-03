//
//  EquerryApp.swift
//  Equerry
//
//  Created by Mario Guerrieri on 8/3/22.
//

import SwiftUI

@main
struct EquerryApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
