//
//  InfoLabel.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import SwiftUI

struct InfoLabel: View {
    let systemImage: String
    let text: String?

    var body: some View {
        if let text {
            HStack {
                Image(systemName: systemImage)
                
                Text(text)
            }
        }
    }
}

extension InfoLabel {
    static func voteAverage(of movie: Movie) -> Self {
        InfoLabel(systemImage: "star", text: "\(movie.voteAverage)")
    }
    
    static func genre(of movie: Movie) -> Self {
        InfoLabel(systemImage: "ticket", text: movie.genres?.first?.name)
    }
    
    static func releaseYear(of movie: Movie) -> Self {
        InfoLabel(systemImage: "calendar", text: movie.yearOfRealease)
    }
    
    static func runtime(of movie: Movie) -> Self {
        InfoLabel(systemImage: "clock", text: movie.runtimeString)
    }
}

#Preview {
    InfoLabel(systemImage: "car", text: "Some Text")
}
