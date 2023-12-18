import SwiftUI

struct ContentView: View {
    @State var main = true
    var body: some View {
        if main {
            
            VStack {
                Spacer()
                HStack {
                    Text("I exist.")
                        .rotationEffect(Angle(degrees: 90))
                    ZStack {
                        Circle()
                            .fill(.teal)
                            .scaledToFit()
                        Image("nerd")
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                    }
                    .padding(CGFloat(10))
                    Text("I exist.")
                        .rotationEffect(Angle(degrees: -90))
                }
                .padding(CGFloat(10))
                Text("Omay Operations")
                    .font(.title)
                    .background( RoundedRectangle(cornerRadius: 10.0, style: .circular).fill(.green))
                    .foregroundColor(.black)
                Spacer()
                HStack {
                    Text("I have been programming for several years, and began with Khan academy. I am most experienced with JavaScript, although in this class I have spent more time learning Swift. Other than those, I also am fairly proficient in Python, and am working on learning Rust. I also do small amounts of Java.")
                    Text("Outside of programming, I spend a lot of time playing games. I've been playing a lot of Minecraft, and also watching Youtubers who code, like Acerola. I am a member of Hack Club, an international organization dedicated to encouage teenagers to get into programming.")
                }
                .padding(CGFloat(10))
                Spacer()
                Button("More") {
                    main.toggle()
                }
                .foregroundColor(.black)
                .frame(width: 75, height: 25, alignment: .center)
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                Spacer()
            }
        } else {
            Text("This button works now.")
            Spacer()
            Button("Back") {
                main.toggle()
            }
            .foregroundColor(.black)
            .frame(width: 75, height: 25, alignment: .center)
            .background(.gray)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
            Spacer()
        }
    }
}
