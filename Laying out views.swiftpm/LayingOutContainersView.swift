import SwiftUI

struct LayingOutContainersView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(themeBlue)
            Circle()
                .foregroundColor(themePink)
        }
        ZStack {
            Rectangle()
                .foregroundColor(themeBlue)
            HStack {
                Circle()
                    .foregroundColor(themeRed)
                Circle()
                    .foregroundColor(themeOrange)
            }
        }
    }
}
