import SwiftUI

struct ContentView: View {
    @State var mons: Double = 0
    @State var upgrades: [[Double]] = [[100, 1.1, 2], [150, 1.2, 1.5], [500, 2, 2], [20000, 1.2, 2]]
    var upgradeNames = ["Better Tap", "Kickstarter (Faster Indie Developer)", "Investor (Faster Development Team)", "Conglomerate (Faster Publisher)"]
    @State var buildings: [[Double]] = [[10, 1.1, 0.1], [100, 1.1, 1], [10000, 2, 50]]
    var buildingNames = ["Indie Developer", "Development Team", "Publisher"]
    @State var monsPerSecond: Double = 0
    @State var monsPerTap: Double = 1
    
    var body: some View {
        VStack {
            Text("App Clicker")
                .font(.largeTitle)
                .offset(x: 0, y: 0)
            Text("Money: \(mons)")
                .offset(x: 0, y: 0)
            Button(action: {
                mons += monsPerTap
            }) {
                RoundedRectangle(cornerRadius: 25, style: .circular)
                    .fill(Color(red: 128 / 255, green: 192 / 255, blue: 192 / 255))
                    .frame(width: 400, height: 400)
                    .contentShape(Rectangle())
                    .offset(x: 0, y: 0)
            }
            HStack {
                VStack {
                    ForEach(0..<upgrades.count) { i in
                        Button(action: {
                            if mons >= upgrades[i][0] {
                                mons -= upgrades[i][0]
                                upgrades[i][0] *= upgrades[i][1]
                                if i == 0 {
                                    monsPerTap *= upgrades[i][2]
                                } else {
                                    buildings[i - 1][2] *= upgrades[i][2]
                                }
                            }
                        }) {
                            Text("\(upgradeNames[i]): \(Int(upgrades[i][0]))")
                                .frame(width: 350, height: 40)
                                .contentShape(Rectangle())
                                .offset(x: 0, y: 0)
                        }
                    }
                }
                VStack {
                    ForEach(0..<buildings.count) { i in
                        Button(action: {
                            if mons >= buildings[i][0] {
                                mons -= buildings[i][0]
                                buildings[i][0] *= buildings[i][1]
                                monsPerSecond += buildings[i][2]
                            }
                        }) {
                            Text("\(buildingNames[i]): \(Int(buildings[i][0]))")
                                .frame(width: 350, height: 40)
                                .contentShape(Rectangle())
                                .offset(x: 0, y: 0)
                        }
                    }
                }
            }
        }
        .onAppear(perform: {
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
                mons += monsPerSecond
            })
        })
    }
}
