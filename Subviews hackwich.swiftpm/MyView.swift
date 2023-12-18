import SwiftUI

struct MyView: View {
    var body: some View {
        VStack {
            ImageView(myColor: .red)
            ImageView(myColor: .blue)
            ImageView(myColor: .white)
            ImageView(myColor: .pink)
            ImageView(myColor: .secondary)
            
            NavigationView {
                NavigationLink("Go to new page") {
                    HelloView()
                }
            }
        }
    }
}

struct ImageView: View {
    let myColor: Color
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(myColor)
        }
    }
}
