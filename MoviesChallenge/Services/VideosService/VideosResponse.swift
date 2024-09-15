//
//  VideosResponse.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

struct VideosResponse: Decodable {
    let id: Int
    let results: [Video]
}
