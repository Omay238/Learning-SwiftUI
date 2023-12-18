import SwiftUI

struct ContentView: View {
    @State private var textFieldName: String = ""
    @State private var number: Int = 9223372036854775807
    
    var body: some View {
        VStack {
            Text("Text Fields")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            Button(action: {
                if let enteredString = Int(textFieldName) {
                    print("Entered text is an integer. Found \(textFieldName)")
                } else {
                    print("Entered text is not an integer. Found \(textFieldName)")
                }
            }, label: {
                Text("Using Button")
                    .font(.title)
            })
            
            TextField("Enter Name", text: $textFieldName)
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
                .onChange(of: textFieldName, perform: { value in
                    if let enteredString = Int(textFieldName) {
                        print("Entered text is an integer. Found \(textFieldName)")
                    } else {
                        print("Entered text is not an integer. Found \(textFieldName)")
                    }
                })
            
            Text("Your name is \(textFieldName)")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            TextField("Enter Number Here", value: $number, format: .number)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            Text("\(number)")
            
            TextField("Enter name & Return", text: $textFieldName) {
                isEditing in
                print("Textfield is editing: \(isEditing)")
            } onCommit: {
                print("Return pressed.")
            }
            .font(.title)
            .multilineTextAlignment(.center)
            .padding()
            
        }
    }
}
