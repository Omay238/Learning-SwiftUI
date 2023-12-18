import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello Hackwich")
                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                .background(.blue)
                .foregroundColor(.yellow)
                .font(.largeTitle)
            Spacer()
        }
    }
}
