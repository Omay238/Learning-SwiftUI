import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("helix")
                .clipShape(Circle())
                .opacity(0.5)
            VStack (spacing: 10) {
                HStack {
                    Text("NW")
                        .font(.caption2)
                    Spacer()
                    Text("N")
                    Spacer()
                    Text("NE")
                        .font(.caption2)
                }
                HStack {
                    Image(systemName: "arrow.up.left")
                    Image(systemName: "arrow.up")
                    Image(systemName: "arrow.up.right")
                }
                HStack {
                    Text("W")
                    Image(systemName: "arrow.left")
                    Image(systemName: "globe")
                    Image(systemName: "arrow.right")
                    Text("E")
                }
                HStack {
                    Image(systemName: "arrow.down.left")
                    Image(systemName: "arrow.down")
                    Image(systemName: "arrow.down.right")
                }
                HStack {
                    Text("SW")
                        .font(.caption2)
                    Spacer()
                    Text("S")
                    Spacer()
                    Text("SE")
                        .font(.caption2)
                }
            }
            .frame(width: 125, height: 125)
        }
    }
}
