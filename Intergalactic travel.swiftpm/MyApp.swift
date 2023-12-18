import SwiftUI

@main
struct MyApp: App {
    @State var myStarVisits = StarTravel()
    var body: some Scene {
        WindowGroup {
            ContentView(myStarVisits: $myStarVisits)
        }
    }
}
