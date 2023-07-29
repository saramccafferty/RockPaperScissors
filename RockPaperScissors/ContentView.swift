//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sara on 18/7/2023.
//

import SwiftUI

struct ContentView: View {
    
    // Enum defining the possible icons for the game.
    enum Icons: String, CaseIterable {
        case scissors = "✌️", paper = "✋", rock = "👊"
        
        // Accessibility label for each icon
        func iconName() -> String {
            switch self {
            case .scissors:
                return "Scissors"
            case .paper:
                return "Paper"
            case .rock:
                return "Rock"
            }
        }
    }
    //    let beats = ["👊", "✌️", "✋"]
    
    // Game state variables
    @State private var appsChoice = 0
    @State private var playerShouldWin: Bool = false
    @State private var score: Int = 0
    @State private var rounds: Int = 0
    @State private var gameOver = false
    
    var body: some View {
        ZStack {
//            Image("texture_background")
//                .resizable()
//                .scaledToFill()
//                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 80) {
                if gameOver {
                    // Game over screen with final score
                    Text("Game Over")
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                    Text("Your score: \(score) / \(rounds)")
                    Button {
                        startNewGame()
                    } label: {
                        Text("Play Again")
                            .padding()
                            .background()
                            .cornerRadius(10)
                    }
                } else {
                    // Game in play screen showing app's chosen icon and players objective
                    Text("Score: \(score)")
                    Text(Icons.allCases[appsChoice].rawValue)
                    .font(Font.system(size: 70))
                    .accessibility(label: Text("Computer played \(Icons.allCases[appsChoice].iconName())"))
                Text(playerShouldWin ? "Choose your hand to WIN" : "Choose your hand to LOSE")
                
                // Buttons for the player to select scissors, paper, rock
                HStack(spacing: 40) {
                    ForEach(Icons.allCases, id: \.self) { icon in
                        Button {
                            playerSelected(icon)
                        } label: {
                            Text(icon.rawValue)
                                .background(Color.purple)
                                .cornerRadius(10)
                                .accessibilityLabel(icon.iconName())
                        }
                    }
                }
                .font(Font.system(size: 70))
                
                Text("Round: \(rounds) / 10")
                
            }
        }
        .font(.largeTitle)
        .multilineTextAlignment(.center)
        .padding()
    }

}
    
    // Function to handle players selection
    func playerSelected(_ selectedIcon: Icons) {
            if !gameOver {
                let appIcon = Icons.allCases[appsChoice]
                let appIconRawValue = appIcon.rawValue
                let playerIconRawValue = selectedIcon.rawValue
                
                // Check if the payer correctly won or lost against the apps choice and update the score
                if appIconRawValue == Icons.rock.rawValue && playerIconRawValue == Icons.paper.rawValue {
                    score += playerShouldWin ? 1 : -1
                } else if appIconRawValue == Icons.paper.rawValue && playerIconRawValue == Icons.scissors.rawValue {
                    score += playerShouldWin ? 1 : -1
                } else if appIconRawValue == Icons.scissors.rawValue && playerIconRawValue == Icons.rock.rawValue {
                    score += playerShouldWin ? 1 : -1
                } else {
                    score += playerShouldWin ? -1 : 1
                }
                rounds += 1
                newRound()
            }
        }

    // Function to start a new round
    func newRound() {
        if rounds < 10 {
            appsChoice = Int.random(in: 0...2)
            playerShouldWin = Bool.random()
        } else {
            gameOver = true
        }
    }
    
    // Function to start a new game reseting the game variables
    func startNewGame() {
        score = 0
        rounds = 0
        gameOver = false
        newRound()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

