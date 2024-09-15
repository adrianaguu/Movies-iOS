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
    private let width: CGFloat?
    private let aspectRatio: CGFloat
    private let cornerRadious: CGFloat
    
    init(path: String?, width: CGFloat?, aspectRatio: CGFloat = 2 / 3, cornerRadious: CGFloat = 16) {
        self.path = path
        self.width = width
        self.aspectRatio = aspectRatio
        self.cornerRadious = cornerRadious
    }

    var body: some View {
        KFImage(ImageURLBuilder.buildURL(baseURL: imagesBaseURL, path: path, size: size))
            .fade(duration: 0.1)
            .placeholder { Color(uiColor: .systemGray5) }
            .resizable()
            .aspectRatio(aspectRatio, contentMode: .fill)
            .frame(width: width)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadious))
    }
}
