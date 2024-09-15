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
    case search(name: String)
    case movieDetail(id: Int)
    case videos(movieID: Int)
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
        case .search: Constants.MovieAPI.searchMoviePath
        case .movieDetail(let id): Constants.MovieAPI.moviePath + String(id)
        case .videos(let movieID): Constants.MovieAPI.moviePath + String(movieID) + "/\(Constants.MovieAPI.videosPath)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .configuration, .popular, .movieDetail, .nowPlaying, .upcoming, .topRated, .search, .videos:
            return .get
        }
    }
    
    var task: Task {
        var parameters = ["api_key": Constants.MovieAPI.key]

        switch self {
        case .configuration, .popular, .movieDetail, .nowPlaying, .upcoming, .topRated, .videos:
            break
        case .search(let name):
            parameters["query"] = name
        }
        
        return  .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }
    
    var headers: [String: String]? {
        ["Content-type": "application/json"]
    }
}

extension MovieTarget: CachePolicyGettable {
    var cachePolicy: URLRequest.CachePolicy {
        switch self {
        case .configuration, .popular, .movieDetail, .nowPlaying, .upcoming, .topRated, .search, .videos:
            return .returnCacheDataElseLoad
        }
    }
}
