import SwiftUI

struct Choose: View {
    @State var circ = true

    var body: some View {
        VStack {
            Button("Swap Snoman") {
                circ.toggle()
            }
            if circ {
                CircleMan()
            } else if !circ {
                SquareMan()
            }
        }
    }
}
