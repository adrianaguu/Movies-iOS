//
//  Movie+MockData.swift
//  MoviesChallengeTests
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

@testable import MoviesChallenge

extension Movie {
    static let mockData: [Movie] = {
        [
            .mock(id: 1, title: "First Movie", overview: "This is First Movie", popularity: 8, voteAverage: 9),
            .mock(id: 2, title: "Second Movie", overview: "This is Second Movie", popularity: 4, voteAverage: 2),
        ]
    }()
    
    static func mock(id: Int, title: String = "Some Title", overview: String = "Overview", popularity: Double = 5, voteAverage: Double = 5) -> Movie {
        Movie(id: id, adult: false, backdropPath: nil, budget: nil, genreIds: nil, genres: nil, homepage: nil, imdbId: nil, originCountry: nil, originalLanguage: "eng", originalTitle: title, overview: overview, popularity: popularity, posterPath: nil, releaseDate: "", revenue: nil, runtime: nil, status: nil, tagline: nil, title: title, video: false, voteAverage: voteAverage, voteCount: 0)
    }
}
