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
                
                results = try await withThrowingTaskGroup(of: Movie.self, returning: [Movie].self) { group in
                    for result in partialResults {
                        group.addTask { try await self.movieService.fetch(by: result.id) }
                    }
                    
                    var movies: [Movie] = []
                    
                    for try await result in group {
                        movies.append(result)
                    }
                    
                    return movies
                }
                
                showEmpyState = results.isEmpty
            } catch {
                debugPrint(error)
            }
        }
    }
}
