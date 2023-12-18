//
//  ContentView.swift
//  that one game with three things you can use
//
//  Created by Omay Operations on 11/7/23.
//

import SwiftUI

struct ContentView: View {
    @State var wins = 1
    @State var ties = 1
    @State var losses = 1
    
    @State var choice = "rock"
    @State var enemChoice = "rock"
    
    @State var angle: Double = 90
    
    @State var speedrunMode = false
    @State var speedrunChoice = ""
    
    @State var running = false
    
    let baseWidth = 393.0
    let baseHeight = 759.0
    @State var width = 0.0
    @State var height = 0.0
    
    @State var widthScale: Double = 1
    @State var heightScale: Double = 1
    @State var regularScale: Double = 1
    
    var body: some View {
        if width == 0 && height == 0 {
            VStack {
                GeometryReader { geometry in
                    VStack {}
                        .onAppear(perform: {
                            width = geometry.size.width
                            height = geometry.size.height
                            widthScale = width / baseWidth
                            heightScale = height / baseHeight
                            regularScale = max(widthScale, heightScale)
                        })
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            VStack {
                Group {
                    Text("Rock, Paper, Scissors")
                        .font(.custom("Billy-Regular", size: 30 * regularScale))
                    BarView(wins: wins, ties: ties, losses: losses, total: Double(wins + ties + losses), regularScale: regularScale, heightScale: heightScale, widthScale: widthScale)
                    
                    Link(destination: URL(string: "https://wrpsa.com/the-official-rules-of-rock-paper-scissors/")!, label: {
                        Text("Help")
                            .font(.custom("Billy-Regular", size: 17 * regularScale))
                            .foregroundStyle(.white)
                            .padding()
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 10 * regularScale))
                    })
                    HStack {
                        Toggle(isOn: $speedrunMode) {}
                            .onChange(of: speedrunMode, {
                                choiceAnim("")
                            })
                            .frame(width: 15 * regularScale, height: 15 * regularScale)
                            .scaleEffect(regularScale)
                            .padding()
                    }
                }
                .offset(y: heightScale * 75)
                Spacer()
                HStack {
                    Image(enemChoice)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300 * regularScale, height: 300 * regularScale)
                        .scaleEffect(CGSize(width: -1.0, height: 1.0))
                        .rotationEffect(Angle(degrees: angle))
                        .offset(x: -50 * widthScale)
                    Spacer()
                    Image(choice)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300 * regularScale, height: 300 * regularScale)
                        .rotationEffect(Angle(degrees: -angle))
                        .offset(x: 50 * widthScale)
                }
                Spacer()
                HStack {
                    Button(action: {
                        if speedrunMode {
                            speedrunChoice = "rock"
                        } else if !running {
                            choiceAnim("rock")
                        }
                    }, label: {
                        Image("rock-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100 * regularScale, height: 100 * regularScale)
                            .opacity(running ? 0.25 : 1)
                    })
                    .padding(5)
                    Button(action: {
                        if speedrunMode {
                            speedrunChoice = "paper"
                        } else if !running {
                            choiceAnim("paper")
                        }
                    }, label: {
                        Image("paper-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100 * regularScale, height: 100 * regularScale)
                            .opacity(running ? 0.25 : 1)
                    })
                    .padding(5)
                    Button(action: {
                        if speedrunMode {
                            speedrunChoice = "scissors"
                        } else if !running {
                            choiceAnim("scissors")
                        }
                    }, label: {
                        Image("scissors-icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100 * regularScale, height: 100 * regularScale)
                            .opacity(running ? 0.25 : 1)
                    })
                    .padding(5 * regularScale)
                }
                .offset(y: -heightScale * 75)
                Spacer()
            }
            .padding()
        }
    }
    func choiceAnim(_ choose: String) {
        if !speedrunMode {
            withAnimation(.easeInOut(duration: 0.5)) {
                running = true
            }
        }
        choice = "rock"
        enemChoice = "rock"
        withAnimation(.easeInOut(duration: 0.5)) {
            angle = 30
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.easeInOut(duration: 0.5)) {
                angle = 90
            }
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 0.5)) {
                angle = 30
            }
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeInOut(duration: 0.5)) {
                angle = 90
            }
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeInOut(duration: 0.5)) {
                angle = 30
            }
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.easeInOut(duration: 0.5)) {
                angle = 90
            }
        }
        DispatchQueue.global().asyncAfter(deadline: .now() + 2.8) {
            if !speedrunMode {
                choice = choose
            } else {
                choice = speedrunChoice == "" ? "rock" : speedrunChoice
            }
            srand48(Int(Date().timeIntervalSince1970))
            enemChoice = ["rock", "paper", "scissors"].randomElement()!
            if speedrunChoice == "" && speedrunMode {
                losses += 1
            } else {
                if choice == enemChoice {
                    ties += 1
                }
                if choice == "rock" && enemChoice == "scissors" {
                    wins += 1
                }
                if choice == "paper" && enemChoice == "rock" {
                    wins += 1
                }
                if choice == "scissors" && enemChoice == "paper" {
                    wins += 1
                }
                if choice == "rock" && enemChoice == "paper" {
                    losses += 1
                }
                if choice == "paper" && enemChoice == "scissors" {
                    losses += 1
                }
                if choice == "scissors" && enemChoice == "rock" {
                    losses += 1
                }
            }
            if speedrunMode {
                DispatchQueue.global().asyncAfter(deadline: .now() + 0.5) {
                    choiceAnim("")
                    speedrunChoice = ""
                }
            }
        }
        if !speedrunMode {
            DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    running = false
                }
            }
        }
    }
}

struct BarView: View {
    var wins: Int
    var ties: Int
    var losses: Int
    
    var total: Double
    
    var height: CGFloat = 60
    
    var regularScale: Double
    var heightScale: Double
    var widthScale: Double
    
    var body: some View {
        HStack (alignment: .bottom) {
            VStack {
                Spacer()
                Rectangle()
                    .fill(.green)
                    .frame(width: 20 * widthScale, height: CGFloat((Double(wins) / total) * height) * heightScale)
                Text("W")
                    .font(.custom("Billy-Regular", size: 17 * regularScale))
                Text("\(wins - 1)")
                    .font(.custom("Billy-Regular", size: 17 * regularScale))
            }
            .frame(height: height + 80 * heightScale)
            VStack {
                Spacer()
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 20 * widthScale, height: CGFloat((Double(ties) / total) * height) * heightScale)
                Text("T")
                    .font(.custom("Billy-Regular", size: 17 * regularScale))
                Text("\(ties - 1)")
                    .font(.custom("Billy-Regular", size: 17 * regularScale))
            }
            .frame(height: height + 80 * heightScale)
            VStack {
                Spacer()
                Rectangle()
                    .fill(.red)
                    .frame(width: 20 * widthScale, height: CGFloat((Double(losses) / total) * height) * heightScale)
                Text("L")
                    .font(.custom("Billy-Regular", size: 17 * regularScale))
                Text("\(losses - 1)")
                    .font(.custom("Billy-Regular", size: 17 * regularScale))
            }
            .frame(height: height + 80 * heightScale)
        }
    }
}

#Preview {
    ContentView()
}
