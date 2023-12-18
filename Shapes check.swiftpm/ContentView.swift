import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Ellipse()
                .stroke(.blue)
            Circle()
                .strokeBorder(.black, lineWidth: 20)
                .background(Circle().fill(.blue))
                .border(.green, width: 5)
                .background(.red)
            Ellipse()
                .frame(width: 100, height: 100, alignment: .center)
            Circle()
                .frame(width: 100, height: 100, alignment: .center)
            Capsule()
                .frame(width: 100, height: 100, alignment: .center)
            RoundedRectangle(cornerRadius: 50, style: .circular)
                .frame(width: 100, height: 100, alignment: .center)
            Rectangle()
                .frame(width: 100, height: 100, alignment: .center)
                .clipShape(Circle())
        }
    }
}
