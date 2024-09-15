//
//  DateFormatter+Extensions.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation

extension DateFormatter {
    static let yearMonthDay: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        return dateFormat
    }()
    
    static let year: DateFormatter = {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy"
        return dateFormat
    }()
}
