import SwiftUI

struct CircleMan: View {
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Rectangle()
                            .fill(.brown)
                            .frame(width: 20, height: 200, alignment: .center)
                            .rotationEffect(Angle(degrees: -45), anchor: .center)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Rectangle()
                            .fill(.brown)
                            .frame(width: 20, height: 200, alignment: .center).rotationEffect(Angle(degrees: 45), anchor: .center)
                        Spacer()
                    }
                    Spacer()
                    Spacer()
                }
                VStack {
                    Spacer()
                    ZStack {
                        Image("smo")
                            .resizable()
                            .frame(width: 400, height: 400, alignment: .bottom)
                            .scaledToFill()
                            .clipShape(Circle())
                        Circle()
                            .stroke(Color.black, style: StrokeStyle(lineWidth: 5))
                            .frame(width: 400, height: 400, alignment: .bottom)
                    }
                }
                ZStack {
                    Image("smo")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                        .scaledToFill()
                        .clipShape(Circle())
                    Circle()
                        .stroke(Color.black, style: StrokeStyle(lineWidth: 5))
                        .frame(width: 300, height: 300, alignment: .center)
                }
                VStack {
                    Spacer()
                    ZStack {
                        Image("smo")
                            .resizable()
                            .frame(width: 200, height: 200, alignment: .center)
                            .scaledToFill()
                            .clipShape(Circle())
                        Circle()
                            .stroke(Color.black, style: StrokeStyle(lineWidth: 5))
                            .frame(width: 200, height: 200, alignment: .bottom)
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                VStack {
                    Spacer()
                    Spacer()
                    HStack {
                        Circle()
                            .fill(.black)
                            .frame(width: 20, height: 20, alignment: .center)
                            .padding(30)
                        Circle()
                            .fill(.black)
                            .frame(width: 20, height: 20, alignment: .center)
                            .padding(30)
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    ZStack {
                        Circle()
                            .fill(.orange)
                            .frame(width: 30, height: 30, alignment: .center)
                        Circle()
                            .fill(.black)
                            .opacity(0.1)
                            .frame(width: 25, height: 25, alignment: .center)
                        Circle()
                            .fill(.black)
                            .opacity(0.1)
                            .frame(width: 20, height: 20, alignment: .center)
                        Circle()
                            .fill(.black)
                            .opacity(0.1)
                            .frame(width: 15, height: 15, alignment: .center)
                        Circle()
                            .fill(.black)
                            .opacity(0.1)
                            .frame(width: 10, height: 10, alignment: .center)
                    }
                    Ellipse()
                        .trim(from: 0.05, to: 0.45)
                        .stroke(.black, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                        .frame(width: 50, height: 30, alignment: .center)
                    Group {
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                }
                VStack {
                    Circle()
                        .fill(.black)
                        .frame(width: 20, height: 20, alignment: .center)
                        .padding(15)
                    Circle()
                        .fill(.black)
                        .frame(width: 20, height: 20, alignment: .center)
                        .padding(15)
                    Circle()
                        .fill(.black)
                        .frame(width: 20, height: 20, alignment: .center)
                        .padding(15)
                }
            }
        }
    }
}
