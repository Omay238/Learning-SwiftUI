import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Text("0")
                    .font(.custom("San Francisco", size: 100))
            }
            HStack {
                Circle()
                    .fill(colorScheme == .dark ? .secondary : .tertiary)
                    .overlay(
                        Text("AC").foregroundColor(colorScheme == .dark ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
                Circle()
                    .fill(colorScheme == .dark ? .secondary : .tertiary)
                    .overlay(
                        Text("+/-").foregroundColor(colorScheme == .dark ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
                Circle()
                    .fill(colorScheme == .dark ? .secondary : .tertiary)
                    .overlay(
                        Text("%").foregroundColor(colorScheme == .dark ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
                Circle()
                    .fill(.orange)
                    .overlay(
                        Text("÷").foregroundColor(colorScheme == .dark ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
            }
            HStack {
                Circle()
                    .fill(colorScheme == .light ? .secondary : .tertiary)
                    .overlay(
                        Text("7").foregroundColor(colorScheme == .light ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
                Circle()
                    .fill(colorScheme == .light ? .secondary : .tertiary)
                    .overlay(
                        Text("8").foregroundColor(colorScheme == .light ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
                Circle()
                    .fill(colorScheme == .light ? .secondary : .tertiary)
                    .overlay(
                        Text("9").foregroundColor(colorScheme == .light ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
                Circle()
                    .fill(.orange)
                    .overlay(
                        Text("x").foregroundColor(colorScheme == .dark ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
            }
            HStack {
                Circle()
                    .fill(colorScheme == .light ? .secondary : .tertiary)
                    .overlay(
                        Text("4").foregroundColor(colorScheme == .light ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
                Circle()
                    .fill(colorScheme == .light ? .secondary : .tertiary)
                    .overlay(
                        Text("5").foregroundColor(colorScheme == .light ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
                Circle()
                    .fill(colorScheme == .light ? .secondary : .tertiary)
                    .overlay(
                        Text("6").foregroundColor(colorScheme == .light ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
                Circle()
                    .fill(.orange)
                    .overlay(
                        Text("-").foregroundColor(colorScheme == .dark ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
            }
            HStack {
                Circle()
                    .fill(colorScheme == .light ? .secondary : .tertiary)
                    .overlay(
                        Text("1").foregroundColor(colorScheme == .light ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
                Circle()
                    .fill(colorScheme == .light ? .secondary : .tertiary)
                    .overlay(
                        Text("2").foregroundColor(colorScheme == .light ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
                Circle()
                    .fill(colorScheme == .light ? .secondary : .tertiary)
                    .overlay(
                        Text("3").foregroundColor(colorScheme == .light ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
                Circle()
                    .fill(.orange)
                    .overlay(
                        Text("+").foregroundColor(colorScheme == .dark ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
            }
            HStack {
                ZStack(alignment: .leading) {
                    Capsule(style: .circular)
                        .fill(colorScheme == .light ? .secondary : .tertiary)
                    Text("0")
                        .foregroundColor(colorScheme == .light ? .black : .white)
                        .font(.custom("San Francisco", fixedSize: 40))
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0))
                }
                Circle()
                    .fill(colorScheme == .light ? .secondary : .tertiary)
                    .overlay(
                        Text(".").foregroundColor(colorScheme == .light ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
                Circle()
                    .fill(.orange)
                    .overlay(
                        Text("=").foregroundColor(colorScheme == .dark ? .black : .white)
                            .font(.custom("San Francisco", fixedSize: 40)))
            }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .aspectRatio(4, contentMode: .fit)
        }
        .padding(EdgeInsets(top: 25, leading: 25, bottom: 25, trailing: 25))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .aspectRatio(1/2, contentMode: .fit)
    }
}
