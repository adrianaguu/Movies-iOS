//
//  MovieAPIConfigurationSaver.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

struct MovieAPIConfigurationSaver {
    private let configurationService: ConfigurationServiceType
    private let storage: Storage
    
    init(configurationService: ConfigurationServiceType = ConfigurationService(), storage: Storage = UserDefaults.standard) {
        self.configurationService = configurationService
        self.storage = storage
    }
    
    func save() async throws {
        let response = try await configurationService.fetch()
        storage.set(response.images.secureBaseUrl, forKey: StorageKey.imagesBaseURL.rawValue)
        let sizeIndex = response.images.posterSizes.count / 2
        storage.set(response.images.posterSizes[sizeIndex], forKey: StorageKey.posterImageSize.rawValue)
    }
}
