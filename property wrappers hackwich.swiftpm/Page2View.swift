import SwiftUI

struct Page2View: View {
    @State var name: String = ""
    @Binding var age: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter Name", text: $name)
                TextField("Enter Age", value: $age, format: .number)
            }
            .padding()
            .textFieldStyle(.roundedBorder)
        }
    }
}
