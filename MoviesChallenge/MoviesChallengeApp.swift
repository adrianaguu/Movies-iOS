//
//  MoviesChallengeApp.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import SwiftUI
import SwiftData

@main
struct MoviesChallengeApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
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
            MainTabView()
        }
        .modelContainer(sharedModelContainer)
    }
    
    init() {
        Task {
            do {
                try await MovieAPIConfigurationSaver().save()
            } catch {
                debugPrint(error)
            }
        }
    }
}
