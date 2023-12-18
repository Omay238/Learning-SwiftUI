import SwiftUI

struct ContentView: View {
    @State private var myOutput: String = "?"
    var body: some View {
        let fruit = ["apple", "pear", "peach", "strawberry"]
        let veggies = ["tomato", "carrot", "pea", "celery"]
        let drinks = ["tea", "coffee", "milk", "soda"]
        let snacks = ["chips", "granola", "nuts", "popcorn"]
        
        let contact = ["Name": "Tom", "Address": "123 Fake Street", "Phone": "123-1234"]
        
        VStack (spacing: 20) {
            Text(myOutput)
                .font(.largeTitle)
            Button("Array 1") {
                var output = ""
                for item in fruit {
                    output += "\(item)\n"
                }
                myOutput = output
            }
            Button("Array 2") {
                var output = ""
                for i in 0...3{
                    output += "\(veggies[i])\n"
                }
                myOutput = output
            }
            Button("Array 3") {
                var output = ""
                for i in 0..<3 {
                    output += "\(drinks[i])\n"
                }
                myOutput = output
            }
            Button("Array 4") {
                var output = ""
                for i in 1..<snacks.count {
                    output += "\(snacks[i])\n"
                }
                myOutput = output
            }
            Button("Dictionary") {
                var output = ""
                for (key, value) in contact {
                    output += "\(key): \(value)\n"
                }
                myOutput = output
            }
        }
    }
}
