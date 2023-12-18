import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        
        WindowGroup {
            
            MMEView()
            
            TabView {
                MVPView().tabItem { 
                    Text("MVP")
                }
                Stretch1View().tabItem { 
                    Text("Stretch #1")
                }
                Stretch2View().tabItem { 
                    Text("Stretch #2")
                }
                
            }
            
            
            
        }
    }
}
