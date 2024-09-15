//
//  HomeView.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()

    var body: some View {
        VStack {
            popularSection
        }
        .task {
            await viewModel.loadMovies()
        }
    }
    
    private var popularSection: some View {
        ScrollView {
            LazyHStack {
                ForEach(viewModel.popularMovies) {
                    Text($0.title)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
