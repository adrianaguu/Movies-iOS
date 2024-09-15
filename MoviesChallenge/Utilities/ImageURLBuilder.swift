//
//  ImageURLBuilder.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

enum ImageURLBuilder {
    static func buildURL(baseURL: String?, path: String?, size: String?) -> URL? {
        guard let baseURL, let path, let size else { return nil }
        
        return URL(string: baseURL)?.appendingPathComponent(size).appending(component: path)
    }
}
