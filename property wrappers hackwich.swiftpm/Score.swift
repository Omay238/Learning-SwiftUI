import SwiftUI

class Score: ObservableObject {
    @Published var highScore: Int
    
    init() {
        self.highScore = 0
    }
}
