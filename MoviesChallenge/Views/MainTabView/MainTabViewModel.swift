//
//  MainTabViewModel.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import Foundation

@Observable final class MainTabViewModel {
    var selection: TabItem
    
    init(selection: TabItem = .home) {
        self.selection = selection
    }
}
