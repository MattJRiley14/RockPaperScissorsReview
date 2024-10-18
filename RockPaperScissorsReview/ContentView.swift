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
    
    var body: some View {
        
        VStack {
            Spacer()
            
            Text("Rock Paper Scissors")
                .font(.largeTitle)
                .bold()

            VStack {
                VStack{
                    Text("Select the option to WIN")
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
            Spacer()
        }
        .alert(alertMessage, isPresented: $showAlert) {
            Button("Continue", action: reload)
        }
    }
    
    func optionTapped(_ num: Int) {
        // Since each option button is assigned a number (Rock = 0, Paper = 1, Scissors = 2) those numbers can be used to determine if the user responed correctly
        if num - 1 == randomIndex || num + 2 == randomIndex {
            alertMessage = "Correct"
        } else {
            alertMessage = "Wrong"
        }
        showAlert = true
    }
    
    func reload() {
        randomIndex = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
