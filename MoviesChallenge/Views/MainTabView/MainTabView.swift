//
//  MainTabView.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var viewModel = MainTabViewModel()
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        TabView(selection: $viewModel.selection) {
            ForEach(TabItem.allCases) { tab in
                NavigationStack {
                    view(for: tab)
                        .navigationDestination(for: Movie.self) { movie in
                            MovieDetails(movieID: movie.id, modelContext: modelContext)
                        }
                }
                .tabItem {
                    Label(tab.name, systemImage: tab.systemImage)
                }
            }
        }
    }
    
    @ViewBuilder
    private func view(for tab: TabItem) -> some View {
        switch tab {
        case .home:
            HomeView()
        case .search:
            SearchView()
        case .watchList:
            WatchList(modelContext: modelContext)
        }
    }
}

#Preview {
    MainTabView()
}
