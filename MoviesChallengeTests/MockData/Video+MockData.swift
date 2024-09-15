//
//  Video+MockData.swift
//  MoviesChallengeTests
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

@testable import MoviesChallenge

extension Video {
    static let mockData: [Video] = {
        [.init(iso6391: "en", iso3166_1: "US", name: "Lock, Stock And Two Smoking Barrels - Trailer", key: "HY7mRdQuUSw", site: "YouTube", size: 1080, type: "Trailer", official: true, publishedAt: "2014-03-20T21:01:38.000Z", id: "64fffb83ffc9de0ee00d3a84")]
    }()
}
