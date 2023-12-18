import SwiftUI

struct ContentView: View {
    
    let basePay = 500.0
    @State var commissionPay = 0.0
    @State var totalPay = 500.0
    
    var body: some View {
        HStack {
            VStack(alignment: .trailing, spacing: 30) {
                Text("Base Pay")
                Text("Commission Pay")
                Text("Total Pay")
            }
            VStack(alignment: .leading, spacing: 30) {
                Text("\(basePay, specifier: "%.2f")")
                
                TextField("Enter Commission Pay Here", value: $commissionPay, format: .currency(code: "USD"))
                
                Text("\(totalPay, specifier: "%.2f")")
            }
        }
        .padding()
        
        Button {
            totalPay = basePay + commissionPay
        }label: {
            Text("Calculate Total Pay")
                .frame(width: 200, height: 40, alignment: .center)
                .foregroundColor(.black)
                .background(.blue)
                .clipShape(Capsule())
        }
        
        Button {
            clear()
        }label: {
            Text("Clear")
                .frame(width: 200, height: 40, alignment: .center)
                .foregroundColor(.black)
                .background(.teal)
                .clipShape(Capsule())
        }
    }
    func clear() {
        totalPay = 0.0
        commissionPay = 0.0
    }
}
