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
        NavigationLink(value: movie) {
            HStack {
                ImageView(path: movie.posterPath)
                    .scaledToFill()
                    .frame(width: 110)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(movie.title)
                        .padding(.bottom)
                        .foregroundColor(.primary)
                    
                    InfoLabel.voteAverage(of: movie)
                    
                    Group {
                        InfoLabel.genre(of: movie)
                        
                        InfoLabel.releaseYear(of: movie)
                        
                        InfoLabel.runtime(of: movie)
                    }
                    .foregroundColor(.primary)
                }
            }
        }
    }
}
