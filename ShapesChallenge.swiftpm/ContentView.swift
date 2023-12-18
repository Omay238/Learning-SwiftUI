import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Circle()
                .size(width: 100, height: 100)
                .background(.blue)
            Rectangle()
                .trim(from: 0, to: 0.75)
                .fill(.green)
            Ellipse()
                .stroke(.orange, style: StrokeStyle(lineWidth: 5))
                .background(.brown)
            Capsule(style: .circular)
                .fill(.cyan)
                .frame(width: 300, height: 100, alignment: .center)
            RoundedRectangle(cornerRadius: 10)
                .fill(.red)
                .frame(width: 200, height: 100, alignment: .center)
            Rectangle()
                .stroke(.black, style: StrokeStyle(lineWidth: 25))
                .background(Rectangle().fill(.blue)).frame(width: 100, height: 100)
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .fill(.blue)
                .frame(width: 300, height: 50, alignment: .center)
                .overlay(
                    Text("Click Me")
                        .font(.custom("American Typewriter", size: 35))
                        .foregroundColor(.white))
            Triangle()
                .fill(.yellow)
                .frame(width: 300, height: 100)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let startPoint = CGPoint(x: rect.midX, y: rect.minY)
        let endPoint1 = CGPoint(x: rect.minX, y: rect.maxY)
        let endPoint2 = CGPoint(x: rect.maxX, y: rect.maxY)
        
        path.move(to: startPoint)
        path.addLine(to: endPoint1)
        path.addLine(to: endPoint2)
        path.addLine(to: startPoint)
        
        return path
    }
}
