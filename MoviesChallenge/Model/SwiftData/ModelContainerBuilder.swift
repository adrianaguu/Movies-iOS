//
//  ModelContainerBuilder.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import Foundation
import SwiftData

enum ModelContainerBuilder {
    static func build(schema: Schema = Schema([WatchListItem.self]), isStoredInMemoryOnly: Bool) -> ModelContainer {
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
}

