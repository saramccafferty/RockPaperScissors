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
        VStack(spacing: 80) {
            if gameOver {
                // Game over screen with final score
                Text("Game Over")
                Text("Your score: \(score) / \(rounds)")
                Button {
                    startNewGame()
                } label: {
                    Text("Play Again")
                }
            } else {
                // Game in play screen showing app's chisen icon and players objective
                Text("Score: \(score)")
                Text(Icons.allCases[appsChoice].rawValue)
                    .font(Font.system(size: 70))
                    .accessibility(label: Text(Icons.allCases[appsChoice].iconName()))
                Text(playerShouldWin ? "Choose to WIN" : "Choose to LOSE")
                
                // Buttons for the player to select scissors, paper, rock
                HStack(spacing: 40) {
                    Button {
                        pickedRock()
                        rounds += 1
                    } label: {
                        Text(Icons.rock.rawValue)
                            .accessibilityLabel(Icons.rock.iconName())
                    }
                    Button {
                        pickedPaper()
                        rounds += 1
                    } label: {
                        Text(Icons.paper.rawValue)
                            .accessibilityLabel(Icons.paper.iconName())
                    }
                    Button {
                        pickedScissors()
                        rounds += 1
                    } label: {
                        Text(Icons.scissors.rawValue)
                            .accessibilityLabel(Icons.scissors.iconName())
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
            if Icons.allCases[appsChoice].rawValue == Icons.rock.rawValue {
                if playerShouldWin {
                    score -= 1
                } else {
                    score += 1
                }
            } else if Icons.allCases[appsChoice].rawValue == Icons.paper.rawValue {
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
            if Icons.allCases[appsChoice].rawValue == Icons.rock.rawValue {
                if playerShouldWin {
                    score += 1
                } else {
                    score -= 1
                }
            } else if Icons.allCases[appsChoice].rawValue == Icons.paper.rawValue {
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
            if Icons.allCases[appsChoice].rawValue == Icons.rock.rawValue {
                if playerShouldWin {
                    score -= 1
                } else {
                    score += 1
                }
            } else if Icons.allCases[appsChoice].rawValue == Icons.paper.rawValue {
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

