import SwiftUI

struct ContentView: View {
    @State var showOutput = -1
    let outputs = [
        "It is\ncertain",
        "It is\ndecidedly\nso",
        "Without\na doubt",
        "Yes\ndefinitely",
        "You may\nrely on it",
        "As\nI see\nit, yes",
        "Most\nlikely",
        "\nOutlook\ngood",
        "Yes",
        "Signs\npoint to\nyes",
        "Reply\nhazy,\ntry again",
        "Ask\nagain later",
        "\nBetter\nnot tell\nyou now",
        "Cannot\npredict now",
        "\n\n\nConcentrate\nand ask again",
        "Don't\ncount on it",
        "My\nreply\nis no",
        "My\nsources\nsay no",
        "\nOutlook\nnot so good",
        "Very\ndoubtful"
    ]
    var body: some View {
        Button (action: {
            showOutput = -1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { 
                showOutput = Int.random(in: 0...19)
            }
        }) {
            ZStack {
                Circle()
                    .fill(.black)
                    .frame(width: 500, height: 500)
                    .padding()
                Circle()
                    .fill(.purple)
                    .frame(width: 200, height: 200)
                    .opacity(0.5)
                if showOutput != -1 {
                    Triangle()
                        .fill(.indigo)
                        .frame(width: 125, height: 125)
                    Text(outputs[showOutput])
                        .foregroundColor(.white)
                } else {
                    Circle()
                        .fill(.white)
                        .frame(width: 200, height: 200)
                    Text("8")
                        .foregroundColor(.black)
                        .font(.system(size: 100))
                }
            }
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}
