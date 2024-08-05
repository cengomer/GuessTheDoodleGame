//
//  GameOverView.swift
//  GuessTheDoodleGame
//
//  Created by omer elmas on 27.06.2024.
//

import SwiftUI

struct GameOverView: View {
    @ObservedObject var matchManager: MatchManager

    var body: some View {
        VStack {
            Spacer()
            
            Image("gameOver")
                .resizable()
                .scaledToFit()
                .padding(.horizontal,70)
                .padding(.vertical)
            
            Text("Score: \(matchManager.score)")
                .font(.largeTitle.bold())
                .foregroundStyle(.primaryYellow)
            Spacer()
            
            Button{
                matchManager.resetGame()
            } label: {
                Text("Menu")
                    .foregroundStyle(.menuBtn)
                    .brightness(-0.4)
                    .font(.largeTitle)
                    .bold()
            }
            .padding()
            .padding(.horizontal,50)
            .background(
                Capsule(style: .circular)
                    .fill(Color(.menuBtn))
                    
            )
            Spacer()
        }
        .background(
        Image("image3")
            .resizable()
            .scaledToFill()
            .scaleEffect(2)
        ).ignoresSafeArea()
    }
}

#Preview {
    GameOverView(matchManager: MatchManager())
}
