//
//  ContentView.swift
//  RockPaperScissorsReview
//
//  Created by BCCS 2022 on 10/18/24.
//

import SwiftUI

struct ContentView: View {
    @State private var options = ["👊", "✋", "✌️"]
    
    // @State private var options = ["Rock", "Paper", "Scissors"]
    
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    // For picking a random option (Rock, Paper, or Scissors)
    @State private var randomIndex = Int.random(in: 0...2)
    
    // Try to WIN or LOSE feature
    @State private var tryToWin = true
    
    // Keep track of score
    @State private var score = 0
    
    // Keep track of number of questions
    @State private var questions = 0
    @State private var showFinalAlert = false
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Rock Paper Scissors")
                .font(.largeTitle)
                .bold()

            VStack {
                VStack{
                    
                    // Try to WIN or LOSE feature
                    Text("Select the option to \(tryToWin ? "WIN" : "LOSE")")
                          .font(.title)
                          .foregroundStyle(.white)
                      
                      // Selecting/Displaying a random option
                      Text(options[randomIndex])
                          .font(.system(size: 100))
                }
                
                HStack {
                    // Displaying three options as buttons from the OPTIONS array
                    // Each button/option is assigned a NUMBER (Rock = 0, Paper = 1, Scissors = 2)
                    ForEach(0..<3){ number in
                        Button {
                            // Any option tapped
                            optionTapped(number)
                        } label: {
                            Text(options[number])
                                .font(.system(size: 75))
                        }
                    }
                }
            }
            .padding(20)
            .background(.gray)
            .cornerRadius(25)

            Spacer()
            
            // Display Score
            Text("Score: \(score)")
                .font(.title)
            
            Spacer()
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Button("Continue", action: reload)
        }
        
        // Final alert
        .alert(alertMessage, isPresented: $showFinalAlert) {
            Button("Restart Game", action: resetGame)
        }

    }
    
    func optionTapped(_ num: Int) {
        
        // Update questions variable
        questions += 1
        print(questions)
        
        // Try to WIN or LOSE feature
        if tryToWin {

            // Since each option button is assigned a number (Rock = 0, Paper = 1, Scissors = 2) those numbers can be used to determine if the user responed correctly
            if num - 1 == randomIndex || num + 2 == randomIndex {
                alertMessage = "Correct"
                
                // Add to score
                score += 1
            } else {
                alertMessage = "Wrong"
                
                // Subtract from score
                if score > 0 {
                    score -= 1
                }
            }

        } else  {
            
            // Try to WIN or LOSE feature
            if num + 1 == randomIndex || num - 2 == randomIndex {
                alertMessage = "Correct"

                // Add to score
                score += 1
            } else {
                alertMessage = "Wrong"

                // Subtract from score
                if score > 0 {
                    score -= 1
                }
            }
        }
        
        // Checking to see if game is over (AKA question equals 10)
        if questions == 10 {
            alertMessage = "Your final score is \(score)"
            showFinalAlert = true
        } else  {
            showAlert = true
        }
    }
    
    func reload() {
        randomIndex = Int.random(in: 0...2)
        
        // Try to WIN or LOSE feature
        tryToWin = !tryToWin
    }
    
    // Function for reseting the game
    func resetGame(){
        reload()
        questions = 0
        score = 0
    }
}

#Preview {
    ContentView()
}
