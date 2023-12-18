import SwiftUI

struct ContentView: View {
    
    @Binding var myStarVisits: StarTravel
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("First Star to Visit", text: $myStarVisits.firstStarName)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .disableAutocorrection(true)
                NavigationLink("Go to First Star") {
                    FirstStarView(myStarVisits: $myStarVisits)
                }
            }
        }
        .navigationTitle("Intergalactic travel")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
         Image("Space")
            .resizable()
            .scaledToFit()
        )
        .navigationViewStyle(.stack)
    }
}
