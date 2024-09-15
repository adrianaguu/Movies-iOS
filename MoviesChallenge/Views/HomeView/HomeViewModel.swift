//
//  HomeViewModel.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

@Observable final class HomeViewModel {
    private(set) var popularMovies: [Movie] = []
    
    private let movieService: MovieService
    
    init(movieService: MovieService = .init()) {
        self.movieService = movieService
    }
    
    func loadMovies() async {
        do {
            popularMovies = try await movieService.fetchPopularList()
        } catch {
            debugPrint(error)
        }
    }
}
