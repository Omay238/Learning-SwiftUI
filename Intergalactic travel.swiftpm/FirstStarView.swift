import SwiftUI

struct FirstStarView: View {
    
    @Binding var myStarVisits: StarTravel
    
    var body: some View {
        Image("\(myStarVisits.firstStarName)Star")
            .resizable()
            .scaledToFit()
        TextField("Second Star to Visit", text: $myStarVisits.secondStarName)
            .textFieldStyle(.roundedBorder)
            .padding()
            .disableAutocorrection(true)
        NavigationLink("Go to Second Star"){
            SecondStarView(myStarVisits: $myStarVisits)
        }
    }
}
