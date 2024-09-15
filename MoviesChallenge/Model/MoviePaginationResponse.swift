//
//  MoviePaginationResponse.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

struct MoviePaginationResponse: Decodable {
    let page: Int
    let results: [Movie]
}
