import SwiftUI

struct Page3View: View {
    @EnvironmentObject var scores: Score
    
    var body: some View {
        VStack {
            Stepper("High Score \(scores.highScore)", value: $scores.highScore)
        }
    }
}
