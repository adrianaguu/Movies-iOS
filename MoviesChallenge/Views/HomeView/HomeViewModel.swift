//
//  HomeViewModel.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

@Observable final class HomeViewModel {
    private var moviesByCategory: [HomeCategory: [Movie]] = [:]
    var categorySelection: HomeCategory = .nowPlaying
    let nonMainCategories = HomeCategory.allCases.filter { !$0.isMain }
    
    private let movieService: MovieServiceType
    
    var mainCategoryMovies: [Movie] {
        movies(of: .popular)
    }
    
    init(movieService: MovieServiceType = MovieService()) {
        self.movieService = movieService
    }
    
    func movies(of category: HomeCategory) -> [Movie] {
        let movies = moviesByCategory[category] ?? []
        return category.isMain ? movies : Array(movies.prefix(6))
    }
    
    func loadMovies() async {
        do {
            moviesByCategory[.popular] = try await movieService.fetchPopularList()
            moviesByCategory[.nowPlaying] = try await movieService.fetchNowPlayingList()
            moviesByCategory[.upcoming] = try await movieService.fetchUpcomingList()
            moviesByCategory[.topRated] = try await movieService.fetchTopRatedList()
        } catch {
            debugPrint(error)
        }
    }
}
