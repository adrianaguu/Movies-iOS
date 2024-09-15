//
//  VideosServiceMock.swift
//  MoviesChallengeTests
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

@testable import MoviesChallenge

struct VideosServiceMock: VideosServiceType {
    let shouldFail: Bool

    func fetch(movieID: Int) async throws -> MoviesChallenge.VideosResponse {
        if shouldFail {
            throw MockNetworkError.failed
        } else {
            return .init(id: movieID, results: Video.mockData)
        }
    }
}
