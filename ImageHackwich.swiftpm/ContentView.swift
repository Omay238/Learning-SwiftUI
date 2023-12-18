import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Images Demo")
            Image("ice")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 300, alignment: .center)
                .background(.blue)
//            Image("alligator-candle")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 350, height: 300, alignment: .center)
//                .background(.blue)
            Image("fluid-filled-balloon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 300, alignment: .center)
                .background(.blue)
//            Image("jebus")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 350, height: 300, alignment: .center)
//                .background(.blue)
            Image(systemName: "bolt.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Image(systemName: "signature")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .background(Image("noise")
            .resizable()
            .scaledToFill()
                    )
    }
}
