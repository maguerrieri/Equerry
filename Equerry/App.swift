//
//  EquerryApp.swift
//  Equerry
//
//  Created by Mario Guerrieri on 8/3/22.
//

import SwiftData
import SwiftUI

@main
struct App: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: [Item.self])
    }
}
