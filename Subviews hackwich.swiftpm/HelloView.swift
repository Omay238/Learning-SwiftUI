import SwiftUI

struct HelloView: View {
    var body: some View {
        VStack {
            Text("Hello Class.")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
    }
}
