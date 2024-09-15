//
//  WatchListItem.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import SwiftData
import Foundation

@Model
final class WatchListItem {
    @Attribute(.unique) let movieID: Int
    let date: Date
    
    init(movieID: Int, date: Date) {
        self.movieID = movieID
        self.date = date
    }
}

