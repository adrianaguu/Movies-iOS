//
//  Genre.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import Foundation

struct Genre: Hashable {
    let id: Int
    let name: String
}

extension Genre: Decodable { }
