//
//  ContentView.swift
//  edutainment-ios-swift
//
//  Created by steffan crowley on 8/22/22.
//

import SwiftUI

struct ContentView: View {
    @State private var firstMultiplier = 0
    @State private var secondMultiplier = Int.random(in: 0...10)
    @State private var answer = 0
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Stepper("\(firstMultiplier.formatted())", value: $firstMultiplier, in:0...10, step: 1)
                }header: {Text("Set the first multiplier")}
                
                Section {
                    Text("\(secondMultiplier)")
                }header: {Text("Second multiplier")}

                Section {
                    TextField("Enter your score", value: $answer, format: .number)
                        .textFieldStyle(.roundedBorder)
                }header: {Text("Input your solution")}

            }

            .navigationTitle("Math Quiz")
            .toolbar {
                Button("Calculate", action: calculate)
            }
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") {}
            } message: {
                Text(alertMessage)
            }
        }
        
    }
    
    func calculate() {
        let solution = firstMultiplier * secondMultiplier
        
        if (solution == answer) {
            alertTitle = "CORRECT!"
            alertMessage = "You are correct!"
        } else {
            alertTitle = "Wrong"
            alertMessage = "Sorry, you are wrong"
        }
        showingAlert = true
        secondMultiplier = Int.random(in: 0...10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
