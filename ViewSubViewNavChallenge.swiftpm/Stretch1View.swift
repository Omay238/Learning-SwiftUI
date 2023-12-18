import SwiftUI

struct Stretch1View: View {
    var body: some View {
        //MARK: Stretch #1 - Part II
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width: 175, height: 175)
            HStack {
                VStack {
                    ttt(text: "X", color: .gray)
                    ttt(text: " ", color: .gray)
                    ttt(text: "O", color: .blue)
                }
                VStack {
                    ttt(text: " ", color: .gray)
                    ttt(text: "O", color: .blue)
                    ttt(text: "X", color: .gray)
                }
                VStack {
                    ttt(text: "O", color: .blue)
                    ttt(text: "X", color: .gray)
                    ttt(text: " ", color: .gray)
                }
            }
        }
        
        
        
    }
}

//MARK: Stretch #1 - Part I


struct ttt: View {
    let text: String
    let color: Color
    var body: some View {
        Text(text)
            .font(.system(size: 25))
            .frame(width: 50, height: 50)
            .background(color)
    }
}
