//
//  ContentView.swift
//  tourny
//
//  Created by Omay Operations on 11/17/23.
//

import SwiftUI

struct ContentView: View {
    @State var choices: [String] = (1...16).map({String($0)})
    @State var choice1: String = ""
    @State var choice2: String = ""
    var body: some View {
        VStack {
            if choices.count > 2 {
                Text("Which is better?")
                    .font(.largeTitle)
                Button(action: {
                    if choices.count > 2 {
                        choices.remove(at: 1)
                        choice1 = choices[0]
                        choice2 = choices[1]
                    }
                }, label: {
                    Image(choice1)
                        .resizable()
                        .scaledToFit()
                })
                Button(action: {
                    if choices.count > 2 {
                        choices.remove(at: 0)
                        choice1 = choices[0]
                        choice2 = choices[1]
                    }
                }, label: {
                    Image(choice2)
                        .resizable()
                        .scaledToFit()
                })
            } else {
                Text("The winner is:")
                    .font(.largeTitle)
                Image(choices[0])
                    .resizable()
                    .scaledToFit()
            }
        }
        .onAppear(perform: {
            choice1 = choices[0]
            choice2 = choices[1]
        })
    }
}

#Preview {
    ContentView()
}
