//
//  LoadingPlayButton.swift
//  MoviesChallenge
//
//  Created by Adriana Gutierrez on 15/09/24.
//

import SwiftUI

struct LoadingPlayButton: View {
    @State private var rotationAngle: Double = .zero
    let color: Color
    let width: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: .zero, to: 0.8)
                .stroke(
                    color,
                    style: StrokeStyle(lineWidth: 8, lineCap: .round)
                )
                .frame(width: width)
                .rotationEffect(.degrees(rotationAngle))
                .onAppear {
                    withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                        rotationAngle = 360
                    }
                }

            Image(systemName: "play.fill")
                .resizable()
                .scaledToFit()
                .frame(width: width / 2.5)
                .foregroundStyle(color)
        }
    }
}

#Preview {
    LoadingPlayButton(color: .accentColor, width: 80)
}
