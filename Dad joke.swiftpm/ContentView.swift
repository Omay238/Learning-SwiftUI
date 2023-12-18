import SwiftUI

struct ContentView: View {
    @State var age: Int = 0;
    var body: some View {
        VStack {
            Text("Why did the chicken cross the road?")
                .font(.largeTitle)
            
            Text("Enter your age")
            
            TextField("Enter your age", value: $age, format: .number)
                .padding()
                .textFieldStyle(.roundedBorder)
            NavigationView {
                NavigationLink(destination: {
                    AnswerView(age: $age)
                }, label: {
                    VStack {
                        Text("?")
                            .padding()
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                            .foregroundColor(.white)
                    }
                })
            }
        }
    }
}

struct AnswerView: View {
    @Binding var age: Int
    var body: some View {
        VStack {
            Text("To get to the other side")
            if age < 30 {
                Image("rolling")
            } else {
                Image("laugh")
            }
        }
    }
}
