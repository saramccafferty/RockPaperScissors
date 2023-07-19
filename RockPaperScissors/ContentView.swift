//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sara on 18/7/2023.
//

import SwiftUI

struct ContentView: View {
    
    enum Icons: String, CaseIterable {
        case scissors = "✌️", paper = "✋", rock = "👊"
    }
    //    let icons = ["✋", "👊", "✌️"]
    let beats = ["👊", "✌️", "✋"]
    
    @State private var appsChoice = 0
    @State private var playerShouldWin: Bool = false
    @State private var score: Int = 0
    @State private var rounds: Int = 0
    @State private var gameOver = false
    
    var body: some View {
        VStack(spacing: 80) {
            if gameOver {
                Text("Game Over")
                Text("Your score: \(score) / \(rounds)")
                Button {
                    startNewGame()
                } label: {
                    Text("Play Again")
                }
            } else {
                Text("Score: \(score)")
                Text(Icons.allCases[appsChoice].rawValue)
                    .font(Font.system(size: 70))
                Text(playerShouldWin ? "Choose to WIN" : "Choose to LOSE")
                
                HStack(spacing: 40) {
                    Button {
                        pickedRock()
                        rounds += 1
                    } label: {
                        Text("👊")
                            .accessibilityLabel("Rock")
                    }
                    Button {
                        pickedPaper()
                        rounds += 1
                    } label: {
                        Text("✋")
                            .accessibilityLabel("Paper")
                    }
                    Button {
                        pickedScissors()
                        rounds += 1
                    } label: {
                        Text("✌️")
                            .accessibilityLabel("Scissors")
                    }
                }
                .font(Font.system(size: 70))
                
                Text("Round: \(rounds) / 10")
                
            }
        }
        .font(.largeTitle)
        .padding()
    }
    
    func pickedRock() {
        if !gameOver {
            if Icons.allCases[appsChoice].rawValue == "👊" {
                if playerShouldWin {
                    score -= 1
                } else {
                    score += 1
                }
            } else if Icons.allCases[appsChoice].rawValue == "✋" {
                if playerShouldWin {
                    score -= 1
                } else {
                    score += 1
                }
            } else {
                if playerShouldWin {
                    score += 1
                } else {
                    score -= 1
                }
            }
            newRound()
        }
    }
    
    func pickedPaper() {
        if !gameOver {
            if Icons.allCases[appsChoice].rawValue == "👊" {
                if playerShouldWin {
                    score += 1
                } else {
                    score -= 1
                }
            } else if Icons.allCases[appsChoice].rawValue == "✋" {
                if playerShouldWin {
                    score -= 1
                } else {
                    score += 1
                }
            } else {
                if playerShouldWin {
                    score -= 1
                } else {
                    score += 1
                }
            }
            newRound()
            
        }
    }
    
    func pickedScissors() {
        if !gameOver {
            if Icons.allCases[appsChoice].rawValue == "👊" {
                if playerShouldWin {
                    score -= 1
                } else {
                    score += 1
                }
            } else if Icons.allCases[appsChoice].rawValue == "✋" {
                if playerShouldWin {
                    score += 1
                } else {
                    score -= 1
                }
            } else {
                if playerShouldWin {
                    score -= 1
                } else {
                    score += 1
                }
            }
            newRound()
            
        }
    }
    
    func newRound() {
        if rounds < 9 {
            appsChoice = Int.random(in: 0...2)
            playerShouldWin = Bool.random()
        } else {
            gameOver = true
        }
    }
    
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

