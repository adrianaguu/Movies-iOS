//
//  MovieDetailsViewModel.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Combine
import Foundation
import SwiftData


@Observable final class MovieDetailsViewModel {
    private let movieID: Int
    private var videos: [Video] = []
    private(set) var movie: Movie?
    
    private let movieService: MovieServiceType
    private let videosService: VideosServiceType
    
    private(set) var watchListItem: WatchListItem?
    private var watchListItemCancellable: AnyCancellable?
    
    let wacthListManager: ModelListManager<WatchListItem>
    
    var youtubeVideoID: String? {
        videos.first { $0.site == "YouTube" }?.key
    }
    
    var isSaved: Bool {
        watchListItem != nil
    }

    init(
        movieID: Int,
        modelContext: ModelContext,
        watchListItem: WatchListItem? = nil,
        movieService: MovieServiceType = MovieService(),
        videosService: VideosServiceType = VideosService()
    ) {
        self.movieID = movieID
        self.watchListItem = watchListItem
        self.movieService = movieService
        self.videosService = videosService
        
        let fetchDescriptor = FetchDescriptor<WatchListItem>(predicate: #Predicate { watchListItem in
            watchListItem.movieID == movieID
        })
        
        wacthListManager = ModelListManager(modelContext: modelContext, fetchDescriptor: fetchDescriptor)
        subscribe()
    }
    
    func toogleAddedToWatchList() {
        if let watchListItem {
            wacthListManager.delete(watchListItem)
        } else {
            wacthListManager.insert(WatchListItem(movieID: movieID, date: Date()))
        }
    }
    
    func loadDetails() async {
        do {
            movie = try await movieService.fetch(by: movieID)
            videos = try await videosService.fetch(movieID: movieID).results
        } catch {
            debugPrint(error)
        }
    }
    
    func subscribe() {
        watchListItemCancellable = wacthListManager.list
            .map { $0.first }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.watchListItem = $0
            }
    }
}
