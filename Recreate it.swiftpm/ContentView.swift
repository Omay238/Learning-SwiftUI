import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(.blue)
                Image(systemName: "play.rectangle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(CGSize(width: 0.9, height: 0.9), anchor: .center)
            }
            HStack {
                ZStack {
                    Rectangle()
                        .fill(.green)
                    Image(systemName: "wallet.pass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(CGSize(width: 0.9, height: 0.9), anchor: .center)
                        .rotationEffect(Angle(degrees: 90), anchor: .center)
                }
                ZStack {
                    Rectangle()
                        .fill(.red)
                    Image(systemName: "globe")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(CGSize(width: 0.9, height: 0.9), anchor: .center)
                }
            }
            ZStack {
                Rectangle()
                    .fill(.yellow)
                Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(CGSize(width: 0.9, height: 0.9), anchor: .center)
            }
            HStack {
                VStack {
                    ZStack {
                        Rectangle()
                            .fill(.blue)
                        Image(systemName: "gear")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(CGSize(width: 0.9, height: 0.9), anchor: .center)
                    }
                    ZStack {
                        Rectangle()
                            .fill(.red)
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .scaleEffect(CGSize(width: 0.9, height: 0.9), anchor: .center)
                    }
                }
                ZStack {
                    Rectangle()
                        .fill(.gray)
                    Image(systemName: "person")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(CGSize(width: 0.9, height: 0.9), anchor: .center)
                }
            }
            .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
        }
        .padding(10)
        .background(.white)
    }
}
