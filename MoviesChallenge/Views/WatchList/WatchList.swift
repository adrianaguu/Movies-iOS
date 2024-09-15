//
//  WatchList.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import SwiftUI
import SwiftData

struct WatchList: View {
    
    @StateObject private var viewModel: WatchListViewModel
    
    init(modelContext: ModelContext) {
        _viewModel = StateObject(wrappedValue: WatchListViewModel(modelContext: modelContext))
    }
    
    var body: some View {
        ZStack {
            if viewModel.movies.isEmpty {
                emptyState
            } else {
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.movies) {
                            MovieRow(movie: $0)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
            }
        }
        .navigationTitle("Watch List")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: viewModel.viewDidAppear)
    }
    
    var emptyState: some View {
        Text("No Movies Added.")
    }
}

#Preview {
    WatchList(modelContext: try! ModelContainer.init(for: WatchListItem.self).mainContext)
}
