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
        ScrollView {
            VStack {
                mainCategory
                
                SectionsPicker(selection: $viewModel.categorySelection, sections: viewModel.nonMainCategories) { category in
                    VerticalGrid(items: viewModel.movies(of: category), columnsCount: 3, horizontalSpacing: 16) { movie in
                        ImageView(path: movie.posterPath, width: nil)
                    }
                }
                .padding()
            }
            .padding(.vertical)
        }
        .task {
            await viewModel.loadMovies()
        }
        .navigationTitle("What do you want to watch?")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var mainCategory: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(Array(zip(viewModel.mainCategoryMovies.indices, viewModel.mainCategoryMovies)), id: \.0) { index, movie in
                    ZStack(alignment: .bottomLeading) {
                        ImageView(path: movie.posterPath, width: 164)
                        
                        Circle()
                            .fill(.background)
                            .frame(width: 36)
                            .overlay {
                                Text("\(index + 1)")
                            }
                            .padding()
                    }
                }
            }
            .padding(.leading)
        }
    }
}

#Preview {
    HomeView()
}
