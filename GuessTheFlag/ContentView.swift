//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mahmoud Abdallah on 5/18/21.
//

import SwiftUI
 
struct ContentView: View {
    
    @State var countries = ["Estonia", "France", "Germany", "Italy", "Russia", "Spain", "UK", "US"].shuffled()
    @State var currentCountryIndex = Int.random(in: 0...2)
    
    @State var showingResult: Bool = false
    @State var score: Int = 0
    @State var scoreTitle: String = ""
    
    @State var previousCountry = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Spacer().frame(width: .none, height: 30, alignment: .center)

                VStack {
                    Text("Tap the flag of")
                        .italic()
                        .foregroundColor(.white).font(.headline)
                    
                    Text(countries[currentCountryIndex])
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                }
                
                ForEach(0..<3) { number in
                    Button(action: {
                        let correctAnswer = self.flagTapped(flagIndex: number)
                        
                        if correctAnswer {
                            self.askQuestion()
                        }else {
                            self.showingResult = true
                        }
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(color: .black, radius: 10)
                            
                    }
                }
                Spacer()
                
                Text("Your score is \(self.score)")
                    .foregroundColor(.white)
            }
            .alert(isPresented: $showingResult, content: {
                Alert(title: Text(self.scoreTitle), message: nil,
                      dismissButton: .default(Text("Continue")) {
                        self.askQuestion()
                      }
                )
            })
        }
    }
    
    func flagTapped(flagIndex: Int) -> Bool{
        if flagIndex == currentCountryIndex {
            self.score += 1
            return true
        }else {
            self.scoreTitle = "Wrong answer, this the flag of \(self.countries[flagIndex])"
            return false
        }
    }
    
    func askQuestion() {
        self.countries.shuffle()
          
        while true {
            self.currentCountryIndex = Int.random(in: 0...2)
            if self.countries[self.currentCountryIndex] != self.previousCountry {
                self.previousCountry = self.countries[self.currentCountryIndex]
                break
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
