//
//  Tab.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import Foundation

enum TabItem: CaseIterable, Hashable, Identifiable {
    case home
    case search
    case watchList
    
    var name: String {
        switch self {
        case .home: "Home"
        case .search: "Search"
        case .watchList: "Watch list"
        }
    }
    
    var systemImage: String {
        switch self {
        case .home: "house"
        case .search: "magnifyingglass"
        case .watchList: "bookmark"
        }
    }
    
    var id: Self { self }
}
