import SwiftUI

struct ContentView: View {
    
    @State var mvpText:String = ""
    
    @State var number1 = 0
    @State var number2 = 0
    
    @State var billAmount:Double? = nil
    
    @State var email = ""
    @State var password = ""
    @State var field1Text = ""
    @State var field2Text = ""
    @State var field1Complain = false
    @State var field2Complain = false
    
    var body: some View {
        VStack {
            Group {
                Divider()
                Text("TextField Challenge")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.title)
                Divider()
            }
            
            VStack {
                Text("MVP")
                Divider()
                
                //MARK: MVP
                TextField("Enter your name", text: $mvpText)
                
                
                
                
                //TODO: MVP, uncomment the line below
                Text(mvpText == "" ? " " : "Hello \(mvpText)")
                
                Divider()
            }
            
            VStack {
                Text("Stretch #1")
                Divider()
                
                //MARK: Stretch #1
                HStack {
                    TextField("", value: $number1, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                    TextField("", value: $number2, format: .number)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                }
                
                
                
                
                //TODO: Stretch #1, uncomment the line below
                Text("\(number1) + \(number2) = \(number1 + number2)")
                
                Divider()
            }
            
            
            VStack {
                Text("Stretch #2")
                Divider()
                
                //MARK: Stretch #2
                TextField("Enter Bill Amount", value: $billAmount, format: .currency(code: "USD"))
                    .textFieldStyle(.roundedBorder)
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 50, alignment: .center)
                
                
                
                
                
                
                //TODO: Stretch #2, uncomment the line below
                Text("Your bill is $\(billAmount ?? 0, specifier: "%.2f")")
                
                Divider()
            }
            
            VStack {
                Text("Stretch #3")
                Divider()
                
                //MARK: Stretch #3
                TextField("Enter your email", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                SecureField("Enter your password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .autocapitalization(.none)
                
                
                
                //TODO: Stretch #3, uncomment the lines below
                Button {
                    EmailHelper.shared.sendEmail(subject: "Congratulations!", body: "You completed Stretch #3 on the textfields Challenge. On behalf of MobileMakersEDU, we would like to congratulate you on your great work. Keep it up", to: email, password: password)
                } label: {
                    Text("Send Email")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(.blue)
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .clipShape(Capsule())
                }
                
                
                Divider()
            }
            
            VStack {
                Text("Stretch #4")
                Divider()
                
                //MARK: Stretch #4
                TextField("Field #1", text: $field1Text) {
                    sel in
                    field1Complain = sel
                }
                .textFieldStyle(.roundedBorder)
                .alert("Why'd ya select field 1, and not me, field 2?", isPresented: $field1Complain) {
                    Button("Sorry", role: .cancel) { }
                }
                TextField("Field #2", text: $field2Text) {
                    sel in
                    field2Complain = sel
                }
                .textFieldStyle(.roundedBorder)
                .alert("Why'd ya select field 2, and not me, field 1?", isPresented: $field2Complain) {
                    Button("Sorry", role: .cancel) { }
                }
                
                
                
                Divider()
            }
            
            Group {
                Spacer()
                Image("mmeLogo")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
            }
            
            
        }
        .frame(maxWidth:.infinity, maxHeight: .infinity)
        .padding(.all)
        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
    }
}
