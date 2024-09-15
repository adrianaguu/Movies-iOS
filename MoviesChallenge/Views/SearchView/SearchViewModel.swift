//
//  SearchViewModel.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

@Observable final class SearchViewModel {
    private(set) var results: [Movie] = [] {
        didSet {
            showEmpyState = false
        }
    }
    private(set) var showEmpyState = false

    var searchText = "" {
        didSet {
            results = []
        }
    }
    
    private let movieService: MovieServiceType
    
    init(movieService: MovieServiceType = MovieService()) {
        self.movieService = movieService
    }
    
    func fetchResults() {
        Task { [weak self] in
            guard let self else { return }
            
            do {
                let partialResults = try await movieService.fetchSearchResults(name: searchText)
                results = try await movieService.fetchMovies(with: partialResults.map { $0.id })
            } catch {
                debugPrint(error)
            }
        }
    }
}
