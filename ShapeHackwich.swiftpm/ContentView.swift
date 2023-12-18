import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello")
                .frame(width: 100, height: 100, alignment: .center)
                .foregroundColor(.black)
                .opacity(0.8)
                .background(Circle())
                    .foregroundColor(.green)
                    .background(.blue)
                    .grayscale(0.2)
                    .opacity(0.8)
        }
    }
}
