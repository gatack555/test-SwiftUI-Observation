//
//  test_SwiftUI_ObservationApp.swift
//  test-SwiftUI-Observation
//
//  Created by Omata Masaki on 2025/03/11.
//

import SwiftUI
import SwiftData

@main
struct test_SwiftUI_ObservationApp: App {
    
    @State var facade:Facade = .init()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
        .environment(facade)
    }
}
