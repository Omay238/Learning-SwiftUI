import SwiftUI

struct ContentView: View {
    @State var arrowImage = "arrow.up"
    
    @State var imageName = ""
    @State var size:Double = 100
    @State var enteredText = ""
    @State var arrowNumber = 0
    @State var alertPresented = false
    
    var body: some View {
        
        Group {
            Divider()
            Text("Events Challenge")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.title)
            Divider()
        }
        
        NavigationView {
            VStack {
                NavigationLink("Change Your Disposition") { 
                    MVPView()
                }
                Spacer()
                
                
                Image(imageName)
                    .resizable()
                    .frame(width: size, height: size)
                //MARK: MVP
                    .onAppear(perform: {
                        if imageName == "HappyFace" {
                            imageName = "SadFace"
                        } else if imageName == "SadFace" {
                            imageName = "HappyFace"
                        } else {
                            imageName = "SadFace"
                        }
                    })
                    .onDisappear(perform: {
                        size += 50
                    })
                
                
                
                
                
                TextField("Enter HappyFace or SadFace", text: $enteredText)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                //MARK: Stretch #1
                    .onSubmit { 
                        imageName = enteredText
                        size = 100
                    }
                
                
                
                
                
               
                Image(systemName: arrowImage)
                    .frame(width: 100, height: 100)
                    .font(.system(size: 100))
                //MARK: Stretch #2
                    .onTapGesture {
                        arrowNumber += 1
                        switch arrowNumber {
                        case 0:
                            arrowImage = "arrow.up"
                        case 1:
                            arrowImage = "arrow.right"
                        case 2:
                            arrowImage = "arrow.down"
                        case 3:
                            arrowImage = "arrow.left"
                        default:
                            arrowNumber = 0
                            arrowImage = "arrow.up"
                        }
                    }
                
                
                
                
                
                
            }
            
        }
        .navigationViewStyle(.stack)
        
        Group {
            Divider()
            Image("MobileMakersEduNB")
                .resizable()
                .frame(maxWidth: .infinity)
                .scaledToFit()
            //MARK: Stretch #3
                .onLongPressGesture(minimumDuration: 5) {
                    alertPresented = true
                }
                .alert("size", isPresented: $alertPresented) {} message: {
                    Text("\(size)")
                }
            
            
            
            
            
        }
        .padding()
    }
}
