import SwiftUI

@main
struct MyApp: App {
    @StateObject var score = Score()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(score)
        }
    }
}
