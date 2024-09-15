//
//  WatchListViewModel.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import SwiftUI
import SwiftData
import Combine

final class WatchListViewModel: ObservableObject {
    @Published private(set) var movies: [Movie] = []
    
    private let wacthListManager: ModelListManager<WatchListItem>
    private let movieService: MovieServiceType
    
    private var wacthListCancellable: AnyCancellable?
    
    init(modelContext: ModelContext, movieService: MovieServiceType = MovieService()) {
        debugPrint("reinit")
        self.movieService = movieService
        
        let fetchDescriptor = FetchDescriptor<WatchListItem>(sortBy: [SortDescriptor(\.date)])
        
        wacthListManager = ModelListManager(modelContext: modelContext, fetchDescriptor: fetchDescriptor)
        subscribe()
    }
    
    func viewDidAppear() {
        wacthListManager.checkUpdates()
    }
    
    private func loadMovies(ids: [Int]) {
        Task {
            do {
                let movies = try await movieService.fetchMovies(with: ids)

                Task { @MainActor in
                    self.movies = movies
                }
            } catch {
                debugPrint(error)
            }
        }
    }
    
    private func subscribe() {
        wacthListCancellable = wacthListManager.list
            .map { $0.map { $0.movieID } }
            .sink { [weak self] ids in
                self?.loadMovies(ids: ids)
            }
    }
}
