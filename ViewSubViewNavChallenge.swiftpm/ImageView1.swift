import SwiftUI

struct ImageView1: View {
    var body: some View {
        Image("image1")
            .resizable()
            .scaledToFit()
    }
}
