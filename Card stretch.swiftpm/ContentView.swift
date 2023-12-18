import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .circular)
                .frame(width: 300, height: 400)
                .offset(x: 38, y: -90)
            VStack {
                Group {
                    HStack {
                        VStack {
                            Text("10")
                                .font(.custom("Gill Sans", size: 50))
                                .foregroundColor(.black)
                            Club()
                                .fill(.black)
                                .frame(width: 40, height: 40)
                                .offset(x: 0, y: -30)
                        }
                        Club()
                            .fill(.black)
                            .frame(width: 60, height: 60)
                        Club()
                            .fill(.black)
                            .frame(width: 60, height: 60)
                            .offset(x: 30, y: 0)
                    }
                    HStack {
                        Club()
                            .fill(.black)
                            .frame(width: 60, height: 60)
                            .offset(x: 45, y: -60)
                    }
                    HStack {
                        Club()
                            .fill(.black)
                            .frame(width: 60, height: 60)
                            .offset(x: 28, y: -90)
                        Club()
                            .fill(.black)
                            .frame(width: 60, height: 60)
                            .offset(x: 59, y: -90)
                    }
                }
                Group {
                    HStack {
                        Club()
                            .fill(.black)
                            .frame(width: 60, height: 60)
                        Club()
                            .fill(.black)
                            .frame(width: 60, height: 60)
                            .offset(x: 30, y: 0)
                    }
                    .offset(x: -58, y: 85)
                    HStack {
                        Club()
                            .fill(.black)
                            .frame(width: 60, height: 60)
                            .offset(x: 45, y: -60)
                    }
                    .offset(x: -88, y: 175)
                    HStack {
                        Club()
                            .fill(.black)
                            .frame(width: 60, height: 60)
                            .offset(x: 28, y: -90)
                        Club()
                            .fill(.black)
                            .frame(width: 60, height: 60)
                            .offset(x: 59, y: -90)
                        VStack {
                            Text("10")
                                .font(.custom("Gill Sans", size: 50))
                                .foregroundColor(.black)
                            Club()
                                .fill(.black)
                                .frame(width: 40, height: 40)
                                .offset(x: 0, y: -30)
                        }
                        .offset(x: -160, y: -84)
                    }
                    .offset(x: -57, y: 274)
                }
                .rotationEffect(Angle(degrees: 180), anchor: .center
                )
            }
        }
    }
}

struct Club: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.5*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.28573*width, y: 0.225*height), control1: CGPoint(x: 0.38172*width, y: 0), control2: CGPoint(x: 0.28573*width, y: 0.1008*height))
        path.addCurve(to: CGPoint(x: 0.36905*width, y: 0.43202*height), control1: CGPoint(x: 0.28675*width, y: 0.30315*height), control2: CGPoint(x: 0.32708*width, y: 0.3692*height))
        path.addCurve(to: CGPoint(x: 0.21429*width, y: 0.375*height), control1: CGPoint(x: 0.32227*width, y: 0.39662*height), control2: CGPoint(x: 0.27027*width, y: 0.37522*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.6*height), control1: CGPoint(x: 0.096*width, y: 0.375*height), control2: CGPoint(x: 0, y: 0.4758*height))
        path.addCurve(to: CGPoint(x: 0.21429*width, y: 0.825*height), control1: CGPoint(x: 0, y: 0.7242*height), control2: CGPoint(x: 0.096*width, y: 0.825*height))
        path.addCurve(to: CGPoint(x: 0.46205*width, y: 0.7*height), control1: CGPoint(x: 0.3101*width, y: 0.8234*height), control2: CGPoint(x: 0.38675*width, y: 0.75635*height))
        path.addCurve(to: CGPoint(x: 0.2619*width, y: height), control1: CGPoint(x: 0.44857*width, y: 0.86832*height), control2: CGPoint(x: 0.42117*width, y: 0.96285*height))
        path.addLine(to: CGPoint(x: 0.7381*width, y: height))
        path.addCurve(to: CGPoint(x: 0.53795*width, y: 0.7*height), control1: CGPoint(x: 0.57882*width, y: 0.96285*height), control2: CGPoint(x: 0.55142*width, y: 0.86832*height))
        path.addCurve(to: CGPoint(x: 0.78572*width, y: 0.825*height), control1: CGPoint(x: 0.61237*width, y: 0.7638*height), control2: CGPoint(x: 0.69045*width, y: 0.81793*height))
        path.addCurve(to: CGPoint(x: width, y: 0.6*height), control1: CGPoint(x: 0.904*width, y: 0.825*height), control2: CGPoint(x: width, y: 0.7242*height))
        path.addCurve(to: CGPoint(x: 0.78572*width, y: 0.375*height), control1: CGPoint(x: width, y: 0.4758*height), control2: CGPoint(x: 0.904*width, y: 0.375*height))
        path.addCurve(to: CGPoint(x: 0.63095*width, y: 0.43202*height), control1: CGPoint(x: 0.7283*width, y: 0.375*height), control2: CGPoint(x: 0.6787*width, y: 0.40142*height))
        path.addCurve(to: CGPoint(x: 0.71427*width, y: 0.225*height), control1: CGPoint(x: 0.67845*width, y: 0.36985*height), control2: CGPoint(x: 0.70972*width, y: 0.30277*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0), control1: CGPoint(x: 0.71427*width, y: 0.1008*height), control2: CGPoint(x: 0.61827*width, y: 0))
        path.closeSubpath()
        return path
    }
}
