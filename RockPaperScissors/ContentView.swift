//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Sara on 18/7/2023.
//

import SwiftUI

struct ContentView: View {
    
//    enum Answer: String, CaseIterable {
//        case scissors, paper, rock
//    }
    let icons = ["Rock", "Paper", "Scissors"]
    let beats = ["👊🏻", "✌🏻", "🤚🏻"]
    
    @State private var random = 0
    @State private var shouldIWin: Bool = false
    @State private var score: Int = 0
    @State private var turns: Int = 0
    @State private var answered: Bool = false
    
    var body: some View {
        VStack(spacing: 60) {
            Text("Score: \(score)")
            Text("Turn: \(turns) / 10")
            Text(icons[random])
            Text(shouldIWin ? "You should win" : "You should lose")
            
            HStack(spacing: 40) {
                Button {
                    pickedRock()
                    turns += 1
                } label: {
                    Text("👊")
                        .font(Font.system(size: 70))
                }
                Button {
                    pickedPaper()
                    turns += 1
                } label: {
                    Text("✋")
                        .font(Font.system(size: 70))
                }
                Button {
                    pickedScissors()
                    turns += 1
                } label: {
                    Text("✌️")
                        .font(Font.system(size: 70))
                }
            }
            .disabled(answered)
            .opacity(answered ? 0.5 : 1.0)
            
            Button {
                random = Int.random(in: 0...2)
                shouldIWin = Bool.random()
                answered = false
            } label: {
                Text("New Turn")
            }
        }
        .padding()
    }
    
    func pickedRock() {
        answered = true
        
        if icons[random] == "Rock" {
            if shouldIWin {
                score -= 1
            } else {
                score += 1
            }
        } else if icons[random] == "Paper" {
            if shouldIWin {
                score -= 1
            } else {
                score += 1
            }
        } else {
            if shouldIWin {
                score += 1
            } else {
                score -= 1
            }
        }
    }
    
    func pickedPaper() {
        
    }
    
    func pickedScissors() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

