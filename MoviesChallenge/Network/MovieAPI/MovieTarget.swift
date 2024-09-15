//
//  MovieTarget.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import Moya
import Foundation

enum MovieTarget {
    case configuration
    case popular
    case nowPlaying
    case upcoming
    case topRated
    case movieDetail(id: Int)
}

extension MovieTarget: TargetType {
    
    var baseURL: URL {
        URL(string: Constants.MovieAPI.baseURL)!
    }
    
    var path: String {
        switch self {
        case .configuration: Constants.MovieAPI.configurationPath
        case .popular: Constants.MovieAPI.popularPath
        case .nowPlaying: Constants.MovieAPI.nowPlayingPath
        case .topRated: Constants.MovieAPI.topRatedPath
        case .upcoming: Constants.MovieAPI.upcomingPath
        case .movieDetail(let id): String(id)
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .configuration, .popular, .movieDetail, .nowPlaying, .upcoming, .topRated:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .configuration, .popular, .movieDetail, .nowPlaying, .upcoming, .topRated:
            return  .requestParameters(parameters: ["api_key": Constants.MovieAPI.key], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }
}

extension MovieTarget: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        switch self {
        case .configuration, .popular, .movieDetail, .nowPlaying, .upcoming, .topRated:
            return .returnCacheDataElseLoad
        }
    }
}
