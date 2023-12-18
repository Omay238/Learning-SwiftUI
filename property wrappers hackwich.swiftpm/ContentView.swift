import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var age: Int = 0
    
    @EnvironmentObject var scores: Score
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter Name", text: $name)
                TextField("Enter Age", value: $age, format: .number)
                TextField("High Score", value: $scores.highScore, format: .number)
                NavigationLink("Page 2") {
                    Page2View(age: $age)
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
        }
    }
}
