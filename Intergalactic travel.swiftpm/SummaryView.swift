import SwiftUI

struct SummaryView: View {
    
    @Binding var myStarVisits: StarTravel
    
    var body: some View {
        Text("You first visited a \(myStarVisits.firstStarName) star")
        Text("It was a trip of \(myStarVisits.firstStarName.count) lightyears!")
        Divider()
        Text("You also visited a \(myStarVisits.secondStarName) star")
        Text("That was a trip of \(myStarVisits.secondStarName.count) lightyears!")
    }
}
