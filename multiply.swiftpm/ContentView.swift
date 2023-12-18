import SwiftUI

struct ContentView: View {
    @State var number1: Double = 0
    @State var number2: Double = 0
    
    @State var clearNumber1: Bool = false
    @State var clearNumber2: Bool = false
    @State var showOutput: Bool = false
    @State var isnan: Bool = false
    
    @State var op: String = ""
    
    var resultText: Text {
        if showOutput {
            let result: String
            if op == "+" {
                result = "\(number1 + number2)"
            } else if op == "-" {
                result = "\(number1 - number2)"
            } else if op == "*" {
                result = "\(number1 * number2)"
            } else if op == "÷" {
                result = "\(number1 / number2)"
            } else if op == "%" {
                result = "\(number1.truncatingRemainder(dividingBy: number2))"
            } else {
                result = "0"
            }
            
            //print(result)
            
            if result == "\(Double.nan)" {
                isnan = true
                print(isnan)
            }
            
            return Text(result)
                .font(.system(size: 80))
        } else {
            return Text(" ")
                .font(.system(size: 80))
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Group {
                    HStack {
                        Spacer()
                        Button(action: {
                            clearNumber1 = true
                        }) {
                            Image(systemName: "clear")
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(.red)
                        }
                        .alert("Are you sure you want to reset number 1?", isPresented: $clearNumber1) {
                            Button(action: {
                                clearNumber1 = false
                                number1 = 0
                                showOutput = false
                            }) {
                                Text("Yes")
                                    .foregroundColor(.red)
                            }
                            Button(action: {
                                clearNumber1 = false
                            }) {
                                Text("No")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding()
                        Spacer()
                        Spacer()
                        Button(action: {
                            clearNumber2 = true
                        }) {
                            Image(systemName: "clear")
                                .resizable()
                                .frame(width: 40, height: 40, alignment: .center)
                                .foregroundColor(.red)
                        }
                        .alert("Are you sure you want to reset number 2?", isPresented: $clearNumber2) {
                            Button(action: {
                                clearNumber2 = false
                                number2 = 0
                                showOutput = false
                            }) {
                                Text("Yes")
                                    .foregroundColor(.red)
                            }
                            Button(action: {
                                clearNumber2 = false
                            }) {
                                Text("No")
                                    .foregroundColor(.blue)
                            }
                        }
                        .padding()
                        Spacer()
                    }
                    HStack {
                        TextField("Number 1", value: $number1, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                            .keyboardType(.numberPad)
                        TextField("Number 2", value: $number2, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .padding()
                            .keyboardType(.numberPad)
                    }
                    HStack {
                        Slider(value: $number1, in: -10000...10000, step: 0.25)
                            .padding()
                        Slider(value: $number2, in: -10000...10000, step: 0.25)
                            .padding()
                    }
                }
                Spacer()
                Group {
                    HStack {
                        Button(action: {
                            op = "+"
                            showOutput = true
                        }) {
                            Text("+")
                                .font(.system(size: 80))
                                .foregroundColor(.cyan)
                                .frame(width: 120, height: 120)
                                .background(
                                    Circle()
                                        .fill(.white)
                                        .offset(x: 0, y: 6)
                                )
                        }
                        Button(action: {
                            op = "-"
                            showOutput = true
                        }) {
                            Text("-")
                                .font(.system(size: 80))
                                .foregroundColor(.pink)
                                .frame(width: 120, height: 120)
                                .background(
                                    Circle()
                                        .fill(.white)
                                        .offset(x: 0, y: 6)
                                )
                        }
                    }
                    HStack {
                        Button(action: {
                            op = "*"
                            showOutput = true
                        }) {
                            Text("*")
                                .font(.system(size: 80))
                                .foregroundColor(.cyan)
                                .offset(x: 0, y: 20)
                                .frame(width: 120, height: 120)
                                .background(
                                    Circle()
                                        .fill(.white)
                                        .offset(x: 0, y: 6)
                                )
                        }
                        Button(action: {
                            op = "÷"
                            showOutput = true
                        }) {
                            Text("÷")
                                .font(.system(size: 80))
                                .foregroundColor(.pink)
                                .frame(width: 120, height: 120)
                                .background(
                                    Circle()
                                        .fill(.white)
                                        .offset(x: 0, y: 6)
                                )
                        }
                    }
                    Button(action: {
                        op = "%"
                        showOutput = true
                    }) {
                        Text("%")
                            .font(.system(size: 80))
                            .foregroundColor(.purple)
                            .frame(width: 120, height: 120)
                            .background(
                                Circle()
                                    .fill(.white)
                                    .offset(x: 0, y: 6)
                            )
                    }
                } 
                Group {
                    resultText
                }
                Spacer()
            }
        }
        .alert("It looks like your output is not a number. You may be using infinity, or dividing by 0.", isPresented: $isnan) {
            Button(action: {
                number1 = 0
                number2 = 0
                op = ""
                showOutput = false
            }) {
                Text("Ok.")
            }
        }
    }
}
