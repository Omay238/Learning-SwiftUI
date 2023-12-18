import SwiftUI

struct ContentView: View {
    @State var status = true
    
    @State var myColor = ""
    @State var output = ""
    @State var number = 0
    @State private var overText = false
    @State private var textChange = false
    @State private var backgroundColor = Color.purple
    @State private var imageChange = false
    
    var body: some View {
//        VStack {
//            Button("Press Me") {
//                status.toggle()
//            }
//            if status {
//                Circle()
//                    .onAppear {
//                        print("Circle Showing")
//                    }
//                    .onDisappear{
//                        print("Where did the circle go?")
//                    }
//            } else {
//                Ellipse()
//                    .onAppear{
//                        print("Ellipse Showing")
//                    }
//                    .onDisappear{
//                        print("Where did the ellipse go?")
//                    }
//            }
//            Text("Press Me")
//                .onTapGesture {
//                    print("Text pressed")
//                }
//        }
        VStack {
            TextField("Enter your favorite color", text: $myColor)
                .foregroundColor(.pink)
                .onSubmit {
                    output = "So you like \(myColor)"
                }
            Divider()
            Text(output)
            
            Stepper(value: $number) {}
                .padding()
                .onChange(of: number) {
                    newValue in
                        print("number is now \(number)")
                }
            Text("\(number)")
            Divider()
            Text("HOVER HERE")
                .font(.largeTitle)
                .foregroundColor(overText ? .green : .red)
                .animation(.easeInOut)
                .onHover { hovering in
                    overText = hovering
                }
            Divider()
            Text(textChange ? "YOU TAPPED" : "TAP HERE")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .onTapGesture {
                    textChange.toggle()
                }
            Image(systemName: imageChange ? "trash" : "trash.fill")
                .font(.system(size: 100))
                .onLongPressGesture(minimumDuration: 5.0) {
                    imageChange.toggle()
                }
        }
        .background(backgroundColor)
        .onTapGesture (count: 3) {
            backgroundColor = Color.secondary
        }
    }
}
