//
//  EquerryApp.swift
//  Equerry
//
//  Created by Mario Guerrieri on 8/3/22.
//

import SwiftUI

@main
struct App: SwiftUI.App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
