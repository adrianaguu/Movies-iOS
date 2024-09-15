//
//  ConfigurationService.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation
import Moya

protocol ConfigurationServiceType {
    func fetch() async throws -> ConfigurationResponse
}

struct ConfigurationService: ConfigurationServiceType {
    let networkManager: NetworkManager<MovieTarget>
    
    init(networkManager: NetworkManager<MovieTarget> = .init(provider: MoyaProvider<MovieTarget>(plugins: [CachePlugin()]), decoder: .snakeCaseDecoder)) {
        self.networkManager = networkManager
    }
    
    func fetch() async throws -> ConfigurationResponse {
        try await networkManager.request(target: .configuration)
    }
}
