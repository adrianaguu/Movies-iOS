//
//  MovieDetails.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import SwiftUI
import Kingfisher
import SwiftData

struct MovieDetails: View {
    @State private var viewModel: MovieDetailsViewModel
    @State private var playerIsReady = false
    
    init(movieID: Int, modelContext: ModelContext) {
        _viewModel = State(wrappedValue: MovieDetailsViewModel(movieID: movieID, modelContext: modelContext))
    }
    
    var body: some View {
        ScrollView {
            VStack {
                if let movie = viewModel.movie {
                    ZStack {
                        videoView
                            .opacity(playerIsReady ? 1 : 0)
                        
                        ImageView(path: movie.backdropPath, cornerRadious: .zero)
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .overlay {
                                LoadingPlayButton(color: .white, width: 60)
                            }
                            .opacity(playerIsReady ? 0 : 1)
                    }
                    .background(.black)
                    
                    VStack(spacing: 20) {
                        HStack(alignment: .bottom) {
                            ImageView(path: movie.posterPath)
                                .scaledToFit()
                                .frame(width: 100)
                            
                            Text(movie.title)
                                .font(.title)
                        }
                        
                        HStack(spacing: 16) {
                            InfoLabel.releaseYear(of: movie)

                            Text("|")
                            
                            InfoLabel.runtime(of: movie)
                            
                            Text("|")
                            
                            InfoLabel.genre(of: movie)
                        }
                        
                        
                        Text(movie.overview)
                            .multilineTextAlignment(.leading)
                    }
                    .padding()
                }
            }
            .navigationTitle("Detail")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        viewModel.toogleAddedTpWatchList()
                    } label: {
                        Image(systemName: viewModel.isSaved ? "bookmark.fill" : "bookmark")
                    }
                }
            }
            .task {
                await viewModel.loadDetails()
            }
        }
    }
    
    @ViewBuilder
    private var videoView: some View {
        if let youtubeVideoID = viewModel.youtubeVideoID {
            YoutubePlayerViewRepresentable(videoID: youtubeVideoID, autoplay: true) {
                playerIsReady = true
            }
            .scaledToFit()
            .frame(maxWidth: .infinity)
        }
    }
    
}

#Preview {
    MovieDetails(movieID: 100, modelContext: try! ModelContainer.init(for: WatchListItem.self).mainContext)
}
