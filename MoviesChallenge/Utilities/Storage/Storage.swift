//
//  Storate.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

protocol Storage {
    func set(_ value: Any?, forKey defaultName: String)
    func string(forKey defaultName: String) -> String?
    func bool(forKey defaultName: String) -> Bool
    func float(forKey defaultName: String) -> Float
    func integer(forKey defaultName: String) -> Int
    func object(forKey defaultName: String) -> Any?
    func removeObject(forKey defaultName: String)
}

extension UserDefaults: Storage { }
