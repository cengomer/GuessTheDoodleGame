//
//  GameView.swift
//  GuessTheDoodleGame
//
//  Created by omer elmas on 27.06.2024.
//

import SwiftUI

var countdownTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

struct GameView: View {
    @ObservedObject var matchManager: MatchManager
    @State var drawingGuess = ""
    @State var eraserEnabled = false
    
    func makeGuess() {
        guard drawingGuess != "" else { return }
        matchManager.sendString("guess:\(drawingGuess)")
        drawingGuess = ""
    }
    var body: some View {
        ZStack {
            GeometryReader{ _ in
                Image(matchManager.currentlyDrawing ? "drawerBg3" : "SS4")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .scaleEffect(1.1)
                
                VStack{
                    topBar
                    ZStack {
                        DrawingView(matchManager: matchManager, eraserEnabled: $eraserEnabled)
                            .aspectRatio(1,contentMode: .fit)
                            .overlay( RoundedRectangle(cornerRadius: 10)
                                .stroke(.black,lineWidth: 10)
                            )
                        
                        VStack {
                            HStack {
                                Spacer()
                                
                                if matchManager.currentlyDrawing {
                                    Button {
                                        eraserEnabled.toggle()
                                    }label: {
                                        Image(systemName: eraserEnabled ? "eraser.fill" : "eraser")
                                            .font(.title)
                                            .foregroundStyle(.primaryPurple)
                                            .padding(.top,10)
                                            
                                    }
                                }
                            }
                            Spacer()
                        }
                        .padding()
                    }
                    pastGuesses
                }
                .padding(.horizontal,30)
                .ignoresSafeArea(.keyboard,edges: .bottom)
            }
            VStack {
                Spacer()
                
                promptGroup
            }
            .ignoresSafeArea(.container)
        }
        .onReceive(countdownTimer) { _ in
            guard matchManager.isTimeKeeper else {return}
            matchManager.remainingTime -= 1
            
        }
    }
    var topBar: some View {
        ZStack {
            HStack {
                Button {
                    matchManager.match?.disconnect()
                    matchManager.resetGame()
                }label: {
                    Image(systemName: "arrowshape.turn.up.left.circle.fill")
                        .font(.largeTitle)
                        .tint(Color(matchManager.currentlyDrawing ? "primaryYellow" : "primaryPurple"))
                }
                Spacer()
                
                Label("\(matchManager.remainingTime)",systemImage: "clock.fill")
                    .bold()
                    .font(.title2)
                    .foregroundStyle(Color(matchManager.currentlyDrawing ? "primaryYellow" : "primaryPurple"))
            }
            Text("Score: \(matchManager.score)")
                .bold()
                .font(.title)
                .foregroundStyle(Color(matchManager.currentlyDrawing ? "primaryYellow" : "primaryPurple"))
        }.padding(.vertical,15)
    }
    var pastGuesses : some View {
        ScrollView {
            ForEach(matchManager.pastGuesses) { guess in
                HStack {
                    Text(guess.message)
                        .font(.title2)
                        .bold(guess.correct)
                    
                    if guess.correct {
                        
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundStyle(matchManager.currentlyDrawing ?
                                             Color(red:0.808, green: 0.345, blue:0.776) :
                                            Color(red:0.243, green:0.773, blue: 0.745))
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom , 1)
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            (matchManager.currentlyDrawing ?
            Color(red: 0.243, green: 0.773, blue: 0.745) :
                Color(.primaryYellow)
            )
            .brightness(-0.2)
            .opacity(0.5)
        )
        .clipShape(.rect(cornerRadius: 20))
        .padding(.vertical)
        .padding(.bottom,130)
    }
    var promptGroup: some View {
        VStack {
            if matchManager.currentlyDrawing {
                Label("DRAW:",systemImage: "exclamationmark.bubble.fill")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                    .padding(.bottom,-10)
                Text(matchManager.drawPrompt.uppercased())
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .foregroundStyle(.primaryYellow)
                    .multilineTextAlignment(.center)
                   
            } else {
                HStack {
                    Label("GUESS THE DRAWING!:",systemImage: "exclamationmark.bubble.fill")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.primaryPurple)
                    
                    Spacer()
                }
                HStack{
                    TextField("Type your guess", text:$drawingGuess)
                        .padding()
                        .background(
                            Capsule(style: .circular)
                                .fill(.white)
                        )
                        .onSubmit(makeGuess)
                    
                    Button {
                        makeGuess()
                    }label: {
                        Image(systemName: "chevron.right.circle.fill")
                            .renderingMode(.original)
                            .foregroundStyle(.primaryPurple)
                            .font(.system(size: 50))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding([.horizontal,.bottom],matchManager.currentlyDrawing ? 0 : 30)
        .padding(.vertical)
        .background(
            (matchManager.currentlyDrawing ?
            Color(red: 0.243, green: 0.773, blue: 0.745) :
                Color(.primaryYellow)
            )
            .opacity(0.5)
            .brightness(-0.2)
        )
    }
}

#Preview {
    GameView(matchManager: MatchManager())
}
