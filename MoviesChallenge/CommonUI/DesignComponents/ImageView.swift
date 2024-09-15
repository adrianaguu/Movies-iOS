//
//  ImageView.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import SwiftUI
import Kingfisher

struct ImageView: View {
    @AppStorage(StorageKey.imagesBaseURL.rawValue) private var imagesBaseURL: String?
    @AppStorage(StorageKey.posterImageSize.rawValue) private var size: String?
    
    private let path: String?
    private let cornerRadious: CGFloat
    
    init(path: String?, cornerRadious: CGFloat = 16) {
        self.path = path
        self.cornerRadious = cornerRadious
    }

    var body: some View {
        KFImage(ImageURLBuilder.buildURL(baseURL: imagesBaseURL, path: path, size: size))
            .fade(duration: 0.1)
            .placeholder { Color(uiColor: .systemGray5) }
            .resizable()
            .clipShape(RoundedRectangle(cornerRadius: cornerRadious))
    }
}
