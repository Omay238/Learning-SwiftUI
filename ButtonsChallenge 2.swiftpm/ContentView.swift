//  Buttons Challenge
//
//  Created by Ben Button
//  Copyright © 2023 MobileMakersEdu. All rights reserved.

import SwiftUI

struct ContentView: View {
    
    @State var changeBackground: Bool = true
    @State var counter: Int = 0
    @State var lightBulbStatus: String = "On"
    @State var showAlert = false
    
    var body: some View {
        VStack(spacing: 40) {
            
            Group {
                Divider()
                Text("Buttons Challenge")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.title)
                Divider()
            }
            
            //MARK: MVP
            HStack{
                Button("1") {
                    print("Button #1 Was Pressed")
                }
                .font(.largeTitle)
                .frame(width: 100, height: 100)
                .background(.red)
                Button(action: {print("Button #2 Was Pressed")}, label: {
                    Text("2")
                        .font(.largeTitle)
                        .frame(width: 100, height: 100)
                        .background(.red)
                })
            }
            
            
            
            
            
            //MARK: Stretch #1
            Button(action: {changeBackground.toggle()}){
                RoundedRectangle(cornerRadius: 25, style: .circular)
                    .fill(.gray)
                    .overlay(Text("Change Background").foregroundColor(.white))
                }
            
            
            
            
            
            
            //MARK: Stretch #2
            Button(action: {
                counter += 1
            }) {
                Capsule()
                    .fill(.gray)
                    .overlay(Text(String(counter)))
            }
            
            
            
            
            
            //MARK: Stretch #3
            Button(action: {
                showAlert = true
            }) {
                Circle()
                    .fill(.white)
                    .overlay(
                    Image(systemName: "key")
                        .foregroundColor(.green)
                    )
                    .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
            }
            .alert("Stretch #3 Complete", isPresented: $showAlert) {
                Button("Ok") {}
            }
            
            
            
            
            
            //MARK: Stretch #4
            HStack {
                Text("The lightbulb is \(lightBulbStatus)")
                    .foregroundColor(.yellow)
                Button(action: {
                    if lightBulbStatus == "On" {
                        lightBulbStatus = "Off"
                    } else {
                        lightBulbStatus = "On"
                    }
                }) {
                    if lightBulbStatus == "On" {
                        Image(systemName: "lightbulb.fill")
                            .foregroundColor(.yellow)
                    } else {
                        Image(systemName: "lightbulb")
                        .foregroundColor(.yellow)
                    }
                }
                
            }
            
            
            
            Group {
                
                Image("MobileMakersEduNB")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                    
            }
            
            
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(changeBackground ? .white : .black)
    }
}

