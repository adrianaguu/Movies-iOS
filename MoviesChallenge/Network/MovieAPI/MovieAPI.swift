//
//  MovieAPI.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import Moya
import Foundation

enum MovieAPI {
    case popular
    case nowPlaying
    case upcoming
    case topRated
    case movieDetail(id: Int)
}

extension MovieAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: Constants.MovieAPI.baseURL) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .popular: Constants.MovieAPI.popularPath
        case .nowPlaying: Constants.MovieAPI.nowPlayingPath
        case .topRated: Constants.MovieAPI.topRated
        case .upcoming: Constants.MovieAPI.upcoming
        case .movieDetail(let id): String(id)
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .popular, .movieDetail, .nowPlaying, .upcoming, .topRated:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .popular, .movieDetail, .nowPlaying, .upcoming, .topRated:
            return  .requestParameters(parameters: ["api_key": Constants.MovieAPI.key], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }
}

extension MovieAPI: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        switch self {
        case .popular, .movieDetail, .nowPlaying, .upcoming, .topRated:
            return .reloadIgnoringLocalCacheData
        }
    }
}
