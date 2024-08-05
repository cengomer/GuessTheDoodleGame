//
//  MenuView.swift
//  GuessTheDoodleGame
//
//  Created by omer elmas on 26.06.2024.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var matchManager: MatchManager
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("logo2")
                .resizable()
                .scaledToFit()
                .scaleEffect(1.4)
                .padding(30)
                .padding(.leading,20)
            
            Spacer()
            
            Button{
                matchManager.startMatchmaking()
            } label: {
                Text("PLAY")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
            }
            .disabled(matchManager.authenticationState != .authenticated || matchManager.inGame)
            .padding(.vertical,20)
            .padding(.horizontal,100)
            .background(
                Capsule(style: .circular)
                    .fill(matchManager.authenticationState == .authenticated || matchManager.inGame ? Color("playBtn") : .gray)
                    
            )

            Text(matchManager.authenticationState.rawValue)
                .font(.headline.weight(.semibold))
                .foregroundStyle(Color("primaryYellow"))
                .padding()
            
            Spacer()
        }
        .background(
        Image("newSC")
            .resizable()
            .scaledToFill()
        ).ignoresSafeArea()
    }
}

#Preview {
    MenuView(matchManager: MatchManager())
}
