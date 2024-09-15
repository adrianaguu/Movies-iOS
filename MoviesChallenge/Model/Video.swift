//
//  Video.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

struct Video {
    let iso6391: String
    let iso3166_1: String
    let name: String
    let key: String
    let site: String
    let size: Int
    let type: String
    let official: Bool
    let publishedAt: String
    let id: String
}

extension Video: Codable {
    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso_639_1"
        case iso3166_1 = "iso_3166_1"
        case name
        case key
        case site
        case size
        case type
        case official
        case publishedAt = "published_at"
        case id
    }
}
