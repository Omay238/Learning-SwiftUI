import SwiftUI

let themeBlue = Color(red: 0.651, green: 0.8431, blue: 0.8471)
let themePink = Color(red: 0.9922, green: 0.7294, blue: 0.6824)
let themeRed = Color(red: 0.8863, green: 0.4078, blue: 0.302)
let themeOrange = Color(red: 0.9843, green: 0.5216, blue: 0.1765)
let darkBrown = Color(red: 0.5216, green: 0.3255, blue: 0.3098)

@main
struct MyApp: App {
    @State var val: String = "😡"
    var body: some Scene {
        WindowGroup {
//            LayingOutContainersView()
//            SizingView()
//            AmazingAlignment()
//            DebuggingView()
            MoodViewFull(value: $val)
        }
    }
}
