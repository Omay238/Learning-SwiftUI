import SwiftUI

struct YellowView: View {
    var body: some View {
        VStack {
            Text("Yellow View")
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.yellow)
    }
}
