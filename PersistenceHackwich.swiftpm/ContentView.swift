import SwiftUI

struct ContentView: View {
    @State var colors: [MyColor] = []
    @AppStorage("NumberOfColors") var colorsCreated = 0
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        Button("Randomize 10 colors") {
            for _ in 1...10 {
                createColor()
            }
            ColorManager().setColors(colors: colors)
        }
        Text("Colors created = \(colorsCreated)")
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(colors, id: \.self) {color in
                    Circle()
                        .fill(Color(red: color.red, green: color.green, blue: color.blue))
                        .frame(width: 50, height: 50, alignment: .center)
                }
            }
        }
        .onAppear(perform: {
            colors = ColorManager().getColors()
        })
    }
    func createColor() {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        colors.append(MyColor(red: red, green: green, blue: blue))
        colorsCreated += 1
    }
}
