//
//  Movie.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import Foundation

struct Movie: Hashable, Identifiable {
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let budget: Int?
    let genreIds: [Int]?
    let genres: [Genre]?
    let homepage: String?
    let imdbId: String?
    let originCountry: [String]?
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let revenue: Int?
    let runtime: Int?
    let status: String?
    let tagline: String?
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    var yearOfRealease: String? {
        guard let date = DateFormatter.yearMonthDay.date(from: releaseDate) else { return nil }
        return DateFormatter.year.string(from: date)
    }
    
    var runtimeString: String? {
        guard let runtime else { return nil }
        return "\(runtime) minutes"
    }
}

extension Movie: Decodable { }
