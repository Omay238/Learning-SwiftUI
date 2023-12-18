//  ConstantsVariablesDataTypes Challenge
//
//  Created by Dr. Datatype
//  Copyright © 2023 MobileMakersEdu. All rights reserved.


import SwiftUI

struct ContentView: View {
    
    //MARK: MVP
    @State var showMVP = true
    let firstName = "Omay"
    
    
    
    var body: some View {
        
        //MARK: Stretch #1
        let lastName: String = "Operations"
        let titleName: String = "Mr."
        let greeting: String = "Hello, \(titleName) \(firstName) \(lastName)"
        
        //MARK: Stretch #2
        let nameOne: String = "Jeremy"
        let nameTwo: String = "Jerry"
        let nameThree: String = "John"
        let nameFour: String = "Jack"
        
        let teamOne: String = "\(nameOne), \(nameTwo)"
        let teamTwo: String = "\(nameThree), \(nameFour)"
        
        //MARK: Stretch #3
        let scoreOne: Int = 32
        let scoreTwo: Int = 25
        let scoreThree: Int = 44
        let scoreFour: Int = 22
        
        let scorePairOne: String = "\(nameOne): \(scoreOne)"
        let scorePairTwo: String = "\(nameTwo): \(scoreTwo)"
        let scorePairThree: String = "\(nameThree): \(scoreThree)"
        let scorePairFour: String = "\(nameFour): \(scoreFour)"
        
        let teamHighScoreOne: String = "\(scorePairOne) & \(scorePairTwo)"
        let teamHighScoreTwo: String = "\(scorePairThree) & \(scorePairFour)"
        
        VStack {
            VStack {
                Group {
                    Divider()
                    Text("Constants, Variables\nData Types Challenge")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .font(.title)
                    Divider()
                }
                //TODO: MVP, Uncomment the line below
                Button("MVP") { showMVP.toggle() }.alert("Your Name is \(firstName)", isPresented: $showMVP){}.font(.largeTitle).foregroundColor(.primary)
                
                Spacer()
                
                Text("Stretch 1")
                    .font(.largeTitle)
                    .underline()
                
                //TODO: Stretch #1, Uncomment the line below
                Text(greeting)
                
                Spacer()
            }
            VStack {
                
                Text("Stretch 2")
                    .font(.largeTitle)
                    .underline()
                
                //TODO: Stretch #2, Uncomment the line below
                Text("Team 1: \(teamOne)\nTeam 2: \(teamTwo)")
                
                
                Spacer()
                Text("Stretch 3")
                    .font(.largeTitle)
                    .underline()
                
                //TODO: Stretch #3, Uncomment the line below
                Text("\(teamHighScoreOne)\n\(teamHighScoreTwo)")
                
                Spacer()
            }
            
            Group {
                Spacer()
                Image("MobileMakersEdu")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
            }
        }
        .padding()
    }
}
