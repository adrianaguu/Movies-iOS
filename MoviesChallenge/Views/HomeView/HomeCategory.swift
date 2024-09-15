//
//  HomeCategory.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

enum HomeCategory: CaseIterable, Hashable, Titleable {
    case popular
    case nowPlaying
    case upcoming
    case topRated
    
    var title: String {
        switch self {
        case .popular: "Popular"
        case .nowPlaying: "NowPlaying"
        case .upcoming: "Upcoming"
        case .topRated: "Top Rated"
        }
    }
    
    var isMain: Bool {
        self == HomeCategory.mainCategory
    }
    
    static let mainCategory = HomeCategory.popular
}
