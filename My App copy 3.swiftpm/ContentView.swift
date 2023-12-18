import SwiftUI

struct ContentView: View {
    @State var myNumber = 0
    @State var guessedNumber = 0
    @State var mysteryNumber = 4
    @State var output = ""
    var body: some View {
        TextField("Enter a number", value: $guessedNumber, format: .number)
            .textFieldStyle(.roundedBorder)
            .padding()
            .onSubmit {
                switch guessedNumber{
                case 1,2,3:
                    output = "Too Low!"
                case mysteryNumber:
                    output = "Correct!"
                default:
                    output = "Too High!"
                }
                
                withAnimation(.linear(duration: 5)) { 
                    myNumber = guessedNumber
                }
                
                myNumber = guessedNumber
            }
        Text(output)
        
        if guessedNumber == 4 {
            Text("That is correct")
        } else if guessedNumber == 1 {
            Text("Too Low")
            Text("Guess Again")
        } else if guessedNumber == 2 {
            Text("Still Too Low")
                .padding()
                .background(.red)
        } else if guessedNumber == 3 {
            Text("Getting Warm")
        } else if guessedNumber > 0 {
            Text("Too High")
        } else {
            Text("Way Too Low")
        }
        
        if myNumber == 4 {
            Text("That is correct")
        } else if myNumber == 1 {
            Text("Too Low")
            Text("Guess Again")
        } else if myNumber == 2 {
            Text("Still Too Low")
                .padding()
                .background(.red)
        } else if myNumber == 3 {
            Text("Getting Warm")
        } else if myNumber > 0 {
            Text("Too High")
        } else {
            Text("Way Too Low")
        }
    }
}
