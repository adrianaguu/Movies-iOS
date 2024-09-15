//
//  MovieRow.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import SwiftUI

struct MovieRow: View {
    let movie: Movie

    var body: some View {
        HStack {
            ImageView(path: movie.posterPath, width: 110)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .padding(.bottom)

                voteAverageLabel
                
                genreLabel
                
                releaseYearLabel
                
                runtimeLabel
            }
        }
    }
    
    private var voteAverageLabel: some View {
        infoLabel(systemImage: "star", text: "\(movie.voteAverage)")
            .foregroundStyle(Color.accentColor)
    }
    
    @ViewBuilder
    private var releaseYearLabel: some View {
        if let year = movie.yearOfRealease {
            infoLabel(systemImage: "calendar", text: year)
        }
    }
    
    @ViewBuilder
    private var genreLabel: some View {
        if let genreTitle = movie.genres?.first?.name {
            infoLabel(systemImage: "ticket", text: genreTitle)
        }
    }
    
    @ViewBuilder
    private var runtimeLabel: some View {
        if let runtime = movie.runtime {
            infoLabel(systemImage: "clock", text: "\(runtime)")
        }
    }
    
    private func infoLabel(systemImage: String, text: String) -> some View {
        HStack {
            Image(systemName: systemImage)
            
            Text(text)
        }
    }
}
