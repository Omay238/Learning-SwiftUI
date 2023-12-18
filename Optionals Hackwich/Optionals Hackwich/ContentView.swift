//
//  ContentView.swift
//  Optionals Hackwich
//
//  Created by Omay Operations on 11/15/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var isShowing = true
    @State var word = ""
    @State var number: Double? = nil
    
    var body: some View {
        TextField("Enter a word", text: $word)
            .textFieldStyle(.roundedBorder)
            .padding()
        TextField("Enter a number", value: $number, format: .number)
            .textFieldStyle(.roundedBorder)
            .padding()
        
        //This example uses force unwrap - unsafe
//        Button("Press Me") {
//            number = number! * 2
//        }
//        .buttonStyle(.borderedProminent)
        
        //This example checks for valid input with if let
//        Button("Press Me") {
//            if let enteredNumber: Int = number {
//                number = enteredNumber * 2
//            } else {
//                print("Number was not entered. Got nil")
//            }
//        }
//        .buttonStyle(.borderedProminent)
        
        //Guard Let to check for valid input
        Button("Press Me") {
            circumference(theRadius: number)
        }
        .buttonStyle(.borderedProminent)
    }
    func circumference(theRadius: Double?) {
        //Guard Let to check for valid input
//        guard let enteredRadius = theRadius else {
//            print("Exiting function")
//            return
//        }
        //coalescing operator (??)
        let enteredRadius = theRadius ?? 0
        let answer = (Double(enteredRadius) * 2 * Double.pi)
        print("Circumference with radius of \(enteredRadius) is \(answer)")
    }
}

#Preview {
    ContentView()
}
