//
//  MovieService.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import Foundation
import Moya

protocol MovieServiceType {
    func fetch(by id: Int) async throws -> Movie
    func fetchSearchResults(name: String) async throws -> [Movie]
    func fetchPopularList() async throws -> [Movie]
    func fetchTopRatedList() async throws -> [Movie]
    func fetchUpcomingList() async throws -> [Movie]
    func fetchNowPlayingList() async throws -> [Movie]
}

struct MovieService: MovieServiceType {
    let networkManager: NetworkManager<MovieTarget>
    
    init(networkManager: NetworkManager<MovieTarget> = .init(provider: MoyaProvider<MovieTarget>(plugins: [CachePlugin()]), decoder: .snakeCaseDecoder)) {
        self.networkManager = networkManager
    }
    
    func fetch(by id: Int) async throws -> Movie {
        try await networkManager.request(target: .movieDetail(id: id))
    }
    
    func fetchSearchResults(name: String) async throws -> [Movie] {
        try await fetch(.search(name: name))
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
    
    private func fetch(_ target: MovieTarget) async throws  -> [Movie] {
        let response: MoviePaginationResponse = try await networkManager.request(target: target)
        return response.results
    }
}
