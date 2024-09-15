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
    private var sharedModelContainer: ModelContainer

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
        .modelContainer(sharedModelContainer)
    }
    
    init() {
        sharedModelContainer = ModelContainerBuilder.build(isStoredInMemoryOnly: false)

        Task {
            do {
                try await MovieAPIConfigurationSaver().save()
            } catch {
                debugPrint(error)
            }
        }
    }
}
