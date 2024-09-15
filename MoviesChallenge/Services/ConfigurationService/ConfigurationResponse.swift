//
//  ConfigurationResponse.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

struct ConfigurationResponse: Codable {
    struct Images: Codable {
        let baseUrl: String
        let secureBaseUrl: String
        let backdropSizes: [String]
        let logoSizes: [String]
        let posterSizes: [String]
        let profileSizes: [String]
        let stillSizes: [String]
    }

    let images: Images
}
