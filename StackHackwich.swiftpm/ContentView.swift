import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack(alignment: .leading, spacing: 30, content: {
//            Image(systemName: "globe")
//                .foregroundColor(.accentColor)
//                .background(.blue)
//            Text("VStack")
//                .background(.red)
//            //Spacer()
//            Text("Womp")
//            Spacer()
//        })
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//        //.frame(width: 100, height: 100)
//        .background(LinearGradient(colors: [.white, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
        ZStack {
            Rectangle()
                .fill(.green)
                .frame(width: 300, height: 300, alignment: .center)
            Circle()
                .fill(.orange)
                .frame(width: 200, height: 200, alignment: .center)
            Rectangle()
                .fill(.blue)
                .frame(width: 100, height: 100, alignment: .center)
        }
    }
}
