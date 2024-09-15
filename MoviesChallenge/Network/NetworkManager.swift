//
//  NetworkManager.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 14/09/24.
//

import Foundation
import Moya

protocol NetworkManagerType {
    associatedtype Target

    func request<T: Decodable>(target: Target) async throws -> T
}

struct NetworkManager<Target: TargetType>: NetworkManagerType {
    private let decoder: JSONDecoder
    private let provider: MoyaProvider<Target>
    
    init(provider: MoyaProvider<Target>, decoder: JSONDecoder) {
        self.provider = provider
        self.decoder = decoder
    }

    func request<T: Decodable>(target: Target) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(target) { result in
                switch result {
                case let .success(response):
                    do {
                        let results = try decoder.decode(T.self, from: response.data)
                        continuation.resume(returning: results)
                    } catch {
                        continuation.resume(throwing: error)
                    }
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
