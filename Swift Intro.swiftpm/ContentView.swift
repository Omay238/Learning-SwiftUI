import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.indigo)
                .opacity(0.5)
            Text("hi, planet")
                .font(.largeTitle)
                .foregroundColor(.yellow)
                .bold()
            Text("Hello World")
                .frame(width: 100, height: 100, alignment: .center)
                .border(.black, width: 1)
                .background(.blue)
        }
    }
}
