//
//  SearchView.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import SwiftUI

struct SearchView: View {
    @State private var viewModel = SearchViewModel()
    
    @Environment(\.isSearching) private var isSearching
    
    var body: some View {
        ZStack {
            if viewModel.searchText.isEmpty {
                emptySearchTextState
            } else if !viewModel.results.isEmpty {
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.results) {
                            MovieRow(movie: $0)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
            } else if viewModel.showEmpyState {
                emptyState
            }
        }
        .searchable(text: $viewModel.searchText)
        .onSubmit(of: .search) {
            viewModel.fetchResults()
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private var emptySearchTextState: some View {
        Text("Search movies by name...")
    }
    
    private var emptyState: some View {
        VStack {
            Text("We Are Sorry, We Can Nor Find The Movie :(")
                .font(.title)
        }
    }
}

#Preview {
    SearchView()
}
