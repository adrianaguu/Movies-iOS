//
//  MainTabView.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var viewModel = MainTabViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.selection) {
            ForEach(TabItem.allCases) { tab in
                NavigationStack {
                    view(for: tab)
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
            EmptyView()
        }
    }
}

#Preview {
    MainTabView()
}
