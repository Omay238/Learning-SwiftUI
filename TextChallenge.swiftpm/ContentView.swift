import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Group {
                //MVP
                Text("Red")
                    .foregroundColor(.red)
                Text("Blue")
                    .background(.blue)
                Text("Big")
                    .font(.system(size: 100))
                Text("Small")
                    .font(.system(size: 8))
                Text("Left")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Right")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                Text("Upside Down")
                    .rotationEffect(Angle(degrees: 180), anchor: .center)
            }
            Group {
                //Stretch 1
                Text("Cool Class")
                    .background(.black)
                    .foregroundColor(.white)
                    .font(.custom("Zapfino", fixedSize: 25))
                //Stretch 2
                Text("With Blue Border\nSize 10\nFrame 200 by 200")
                    .frame(width: 200, height: 200, alignment: .center)
                    .background(.yellow)
                    .border(.blue, width: 10)
                    .multilineTextAlignment(.center)
                //Stretch 3
                Text("👍")
                    .font(.system(size: 100))
                    .frame(width: 200, height: 100, alignment: .center)
                    .background(LinearGradient(colors: [.green, .blue], startPoint: .top, endPoint: .bottom))
                //Stretch 4
                Text("Hello World")
                    .frame(width: 200, height: 200, alignment: .center)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .background(
                        Image("bg")
                            .resizable()
                            .scaledToFit()
                    )
            }
        }
    }
}
