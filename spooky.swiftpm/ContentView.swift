import SwiftUI

struct ContentView: View {
    @State var page = -2
    @State var name = ""
    
    var body: some View {
        VStack {
            if page == -2 {
                TextField("Please enter your name", text: $name)
                    .padding()
                    .multilineTextAlignment(.center)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        withAnimation(
                            .easeInOut,
                            {
                                page = -1
                            })
                    }
                Button(action: {
                    withAnimation(.easeInOut(duration: 1.5), {
                        page = -1
                    })
                }) {
                    Text("Submit")
                        .padding()
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
            } else if page == -1 {
                Text("Welcome, \(name), to your job at Yellowstone.")
                    .onAppear(perform: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeInOut(duration: 1.5), {
                                self.page = 0
                            })
                        }
                    })
            } else {
                UIPage(page: page, name: name)
            }
        }
    }
}

struct UIPage: View {
    @State var page: Int
    var name: String
    @State private var yOffset: CGFloat = 0
    var body: some View {
        Image("p\(page + 1)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 250)
            .onTapGesture {
                withAnimation(.easeOut, {
                    self.yOffset = -UIScreen.main.bounds.height
                })
            }
            .offset(y: yOffset)
        Text(story.pages[page].text.replacingOccurrences(of: "{name}", with: name))
            .font(.system(size: 20))
            .padding()    
        ForEach(story.pages[page].choices, id: \.0) { choice in
            Button(action: {
                withAnimation(.easeOut, {
                    self.yOffset = -UIScreen.main.bounds.height
                })
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.easeInOut, {
                        self.page = choice.1
                        self.yOffset = 0
                    })
                }
            }) {
                Text(choice.0)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(10)
            }
        }
    }
}
