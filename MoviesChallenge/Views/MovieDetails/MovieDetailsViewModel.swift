//
//  MovieDetailsViewModel.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

@Observable final class MovieDetailsViewModel {
    private let movieID: Int
    private var videos: [Video] = []
    private(set) var movie: Movie?
    
    private let movieService: MovieServiceType
    private let videosService: VideosServiceType
    
    var youtubeVideoID: String? {
        videos.first { $0.site == "YouTube" }?.key
    }

    init(movieID: Int, movieService: MovieServiceType = MovieService(), videosService: VideosServiceType = VideosService()) {
        self.movieID = movieID
        self.movieService = movieService
        self.videosService = videosService
    }
    
    func loadDetails() async {
        do {
            movie = try await movieService.fetch(by: movieID)
            videos = try await videosService.fetch(movieID: movieID).results
        } catch {
            debugPrint(error)
        }
    }
}
