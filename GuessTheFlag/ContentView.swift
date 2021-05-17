//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mahmoud Abdallah on 5/18/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlter: Bool = false
    
    var body: some View {
        
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
        
        
        VStack(spacing: 10) {

            HStack {
                Text("1").padding()
                Text("2").padding()
                Text("3").padding()
            }

            Text("First").padding()
            Text("Second").padding()
            Text("Third").padding()
            
            Button(action: {
                print("Hello World")
            }) {
                Text("Click me")
            }
            
            // Show an alert when button is clicked
            Button("Show alert") {
                self.showingAlter = true
            }.alert(isPresented: $showingAlter) {
                Alert(title: Text("This is a title"), message: Text("This is some detail"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
