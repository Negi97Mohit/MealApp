//
//  mealApp1App.swift
//  mealApp1
//
//  Created by param madan on 29/01/24.
//

import SwiftUI

@main
struct mealApp1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ConntentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
