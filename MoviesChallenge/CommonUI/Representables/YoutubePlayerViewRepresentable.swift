//
//  YoutubePlayerViewRepresentable.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import Foundation
import SwiftUI
import YouTubeiOSPlayerHelper

struct YoutubePlayerViewRepresentable: UIViewRepresentable {
    let videoID: String
    let autoplay: Bool
    var playerViewDidBecomeReady: (() -> Void)?
    
    init(videoID: String, autoplay: Bool, playerViewDidBecomeReady: (() -> Void)?) {
        self.videoID = videoID
        self.autoplay = autoplay
        self.playerViewDidBecomeReady = playerViewDidBecomeReady
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> YTPlayerView {
        let player = YTPlayerView()
        player.backgroundColor = .black
        
        let numericAutoplayValue = autoplay ? 1 : 0

        let playerVars: [String: Any] = [
            "autoplay": numericAutoplayValue,
            "mute": numericAutoplayValue
        ]

        player.load(withVideoId: videoID, playerVars: playerVars)
        player.delegate = context.coordinator
        return player
    }
    
    func updateUIView(_ uiViewController: YTPlayerView, context: Context) { }
    
    final class Coordinator: NSObject, YTPlayerViewDelegate {
        let parent: YoutubePlayerViewRepresentable
        
        init(parent: YoutubePlayerViewRepresentable) {
            self.parent = parent
        }
        
        func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
            parent.playerViewDidBecomeReady?()
        }
        
        func playerViewPreferredWebViewBackgroundColor(_ playerView: YTPlayerView) -> UIColor {
            .clear
        }
    }
}
