//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mahmoud Abdallah on 5/18/21.
//

import SwiftUI

//      Old stuff
//        ZStack {
//            // This will take a space and change the background color of it
//
//            // In this case, we are using ZStack, so the color will be in z=0 and text in z=1
//            // But if HStack is used this will result in a little vertical space for the text, and the rest will have a gray background color
//            Color.gray.frame(width:200, height: 200) // We cna also set the width and height
//            Text("This is a text")
//        }
        
        
//        // Gradient background colors
//        ZStack {
//            LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .leading, endPoint: .trailing).ignoresSafeArea()
//
//            RadialGradient(gradient: Gradient(colors: [Color.black.opacity(0.6), Color.red.opacity(0.0)]), center: .center, startRadius: 5, endRadius: 200)
//        }
        
//        // Angular gradeint background color
//        ZStack {
//            AngularGradient(gradient: Gradient(colors: [.red, .blue, .green, .yellow, .pink, .red]), center: .center)
//        }
        
        
//VStack(spacing: 10) {
//
//    HStack {
//        Text("1").padding()
//        Text("2").padding()
//        Text("3").padding()
//    }
//
//    Text("First").padding()
//    Text("Second").padding()
//    Text("Third").padding()
//
//    Button(action: {
//        print("Hello World")
//    }) {
//        Text("Click me")
//    }
//
//    // Show an alert when button is clicked
//    Button("Show alert") {
//        self.showingAlter = true
//    }.alert(isPresented: $showingAlter) {
//        Alert(title: Text("This is a title"), message: Text("This is some detail"), dismissButton: .default(Text("OK")))
//    }
//}



struct ContentView: View {
    
    @State var countries = ["Estonia", "France", "Germany", "Italy", "Russia", "Spain", "UK", "US"].shuffled()
    @State var currentCountryIndex = Int.random(in: 0...2)
    
    @State var showingResult: Bool = false
    @State var score: Int = 0
    @State var scoreTitle: String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
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
        self.currentCountryIndex = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
