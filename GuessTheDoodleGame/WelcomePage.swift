//
//  WelcomePage.swift
//  Doodle Dash Online
//
//  Created by omer elmas on 6.07.2024.
//

import SwiftUI

struct WelcomePage: View {
    @State private var currentIndex = 0
    @State private var showContentView = false
    
    let pages = [
        WelcomePageItem(title: "Welcome to Doodle Dash!", description: "You will have a nice playing experience.", imageName: "removed"),
        WelcomePageItem(title: "Challenge Friends", description: "Compete with your friends and see who can guess the doodles fastest.", imageName: "removed2"),
        WelcomePageItem(title: "Leaderboard", description: "Climb the leaderboard and become the top doodler.", imageName: "newLo")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $currentIndex) {
                    ForEach(0..<pages.count, id: \.self) { index in
                        VStack {
                            Image(pages[index].imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                            
                            Text(pages[index].title)
                                .font(.largeTitle)
                                .bold()
                                .padding(.top, 20)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.white)
                            
                            Text(pages[index].description)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding()
                                .foregroundStyle(.yellow)
                                .bold()
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                
                Button(action: {
                    if currentIndex < pages.count - 1 {
                        currentIndex += 1
                    } else {
                        showContentView = true
                    }
                }) {
                    Text(currentIndex < pages.count - 1 ? "Next" : "Log In")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        .padding(.vertical, 10)
                        .padding(.horizontal, 30)
                        .background(
                            Capsule(style: .circular)
                                .fill(Color.blue)
                        )
                }
                .padding(.bottom, 20)
                .navigationDestination(isPresented: $showContentView) {
                    ContentView()
                }
            }
            .background(
                Image("red")
            )
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showContentView = true
                    }) {
                        Text("Skip")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            }
        }
    }
}

#Preview {
    WelcomePage()
}
