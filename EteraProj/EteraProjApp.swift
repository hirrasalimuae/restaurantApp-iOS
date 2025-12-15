//
//  EteraProjApp.swift
//  EteraProj
//
//  Created by Hirra on 15/12/2025.
//

import SwiftUI
import CoreData

@main
struct EteraProjApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MapScreenView() // New main screen
        }
    }
}
