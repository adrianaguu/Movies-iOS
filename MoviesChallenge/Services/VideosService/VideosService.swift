//
//  VideoService.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation
import Moya

protocol VideosServiceType {
    func fetch(movieID: Int) async throws -> VideosResponse
}

struct VideosService: VideosServiceType {
    let networkManager: NetworkManager<MovieTarget>
    
    init(networkManager: NetworkManager<MovieTarget> = .init(provider: MoyaProvider<MovieTarget>(plugins: [CachePlugin()]), decoder: .init())) {
        self.networkManager = networkManager
    }
    
    func fetch(movieID: Int) async throws -> VideosResponse {
        try await networkManager.request(target: .videos(movieID: movieID))
    }
}
