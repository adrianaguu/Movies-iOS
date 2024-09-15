//
//  MovieServiceMock.swift
//  MoviesChallengeTests
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

@testable import MoviesChallenge

struct MovieServiceMock: MovieServiceType {
    let shouldFail: Bool

    func fetch(by id: Int) async throws -> MoviesChallenge.Movie {
        try checkShouldFail()
        return Movie.mock(id: id)
    }
    
    func fetchMovies(with ids: [Int]) async throws -> [MoviesChallenge.Movie] {
        try checkShouldFail()
        return ids.map { Movie.mock(id: $0) }
    }
    
    func fetchSearchResults(name: String) async throws -> [MoviesChallenge.Movie] {
        try checkShouldFail()
        return [Movie.mock(id: 0, title: name)]
    }
    
    func fetchPopularList() async throws -> [MoviesChallenge.Movie] {
        try checkShouldFail()
        return Movie.mockData.sorted { $0.popularity < $1.popularity }
    }
    
    func fetchTopRatedList() async throws -> [MoviesChallenge.Movie] {
        try checkShouldFail()
        return Movie.mockData.sorted { $0.voteAverage < $1.voteAverage }
    }
    
    func fetchUpcomingList() async throws -> [MoviesChallenge.Movie] {
        try checkShouldFail()
        return Movie.mockData
    }
    
    func fetchNowPlayingList() async throws -> [MoviesChallenge.Movie] {
        try checkShouldFail()
        return Movie.mockData
    }
    
    private func checkShouldFail() throws {
        guard shouldFail else { return }
        throw MockNetworkError.failed
    }
}
