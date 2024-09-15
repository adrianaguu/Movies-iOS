//
//  MovieService.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import Foundation
import Moya

protocol MovieServiceType {
    func fetchPopularList() async throws -> [Movie]
    func fetchTopRatedList() async throws -> [Movie]
    func fetchUpcomingList() async throws -> [Movie]
    func fetchNowPlayingList() async throws -> [Movie]
}

struct MovieService {
    let networkManager: NetworkManager<MovieAPI>
    
    init(networkManager: NetworkManager<MovieAPI> = .init(provider: MoyaProvider<MovieAPI>(plugins: [CachePlugin()]), decoder: .snakeCaseDecoder)) {
        self.networkManager = networkManager
    }
    
    func fetchPopularList() async throws -> [Movie] {
        try await fetch(.popular)
    }
    
    func fetchTopRatedList() async throws -> [Movie] {
        try await fetch(.topRated)
    }
    
    func fetchUpcomingList() async throws -> [Movie] {
        try await fetch(.upcoming)
    }
    
    func fetchNowPlayingList() async throws -> [Movie] {
        try await fetch(.nowPlaying)
    }
    
    private func fetch(_ target: MovieAPI) async throws  -> [Movie] {
        let response: MoviePaginationResponse = try await networkManager.request(target: target)
        return response.results
    }
}
