import SwiftUI

struct SecondStarView: View {
    
    @Binding var myStarVisits: StarTravel
    
    var body: some View {
        Image("\(myStarVisits.secondStarName)Star")
            .resizable()
            .scaledToFit()
        TextField("Second Star to Visit", text: $myStarVisits.secondStarName)
            .textFieldStyle(.roundedBorder)
            .padding()
            .disableAutocorrection(true)
        NavigationLink("Go to Summary"){
            SummaryView(myStarVisits: $myStarVisits)
        }
    }
}
