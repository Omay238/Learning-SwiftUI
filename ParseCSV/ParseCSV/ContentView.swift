//
//  ContentView.swift
//  ParseCSV
//
//  Created by Allen Norskog on 10/30/23.
//

import SwiftUI

struct ContentView: View {
    @State var image: UIImage?
    @State var srcX: Int = 2200
    @State var srcY: Int = 250
    @State var destX: Int = 1300
    @State var destY: Int = 900
    @State var line: [CGPoint] = []
    @State var sz: CGSize = .zero
    @State var setSrc = true
    @State var data: [[Double]] = []
    let fileName = "slope"

    var body: some View {
        VStack (spacing: 0) {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .overlay {
//                        Canvas {context, size in
//                            var path = Path()
//                            let xScale = size.width / 3200.0
//                            let yScale = size.height / 3200.0
//                            let next = line.map { CGPoint(x: $0.x * xScale, y: $0.y * yScale) }
//                            path.addLines(next)
//                            var endPath = Path()
//                            endPath.move(to: next[0])
//                            endPath.addEllipse(in: CGRect(origin: next[0], size: CGSize(width: 5, height: 5)))
//                            var startPath = Path()
//                            startPath.move(to: next[next.count - 1])
//                            startPath.addEllipse(in: CGRect(origin: next[next.count - 1], size: CGSize(width: 5, height: 5)))
//                            context.stroke(path, with: .color(.yellow), lineWidth: 5)
//                            context.fill(endPath, with: .color(.red))
//                            context.fill(startPath, with: .color(.green))
//                        }
//                    }
                    .padding(0)
                    .saveSize(in: $sz)
                    .onTapGesture { value in
                        if setSrc {
                            srcX = Int(value.x * 3200.0 / sz.width)
                            srcY = Int(value.y * 3200.0 / sz.height)
                            srcX = max(0, min(srcX, 3200))
                            srcY = max(0, min(srcY, 3200))
                        } else {
                            destX = Int(value.x * 3200.0 / sz.width)
                            destY = Int(value.y * 3200.0 / sz.height)
                            destX = max(0, min(destX, 3200))
                            destY = max(0, min(destY, 3200))
                        }
                        setSrc.toggle()
                    }
            } else {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
            }
            Toggle(isOn: $setSrc, label: {})
            Button {
                data = DoubleFile.fromCSV(fileName: fileName)
//                print(data)
//                var data2: [[Int]] = data.map   { $0.map { $0 >= 15 ? 0 : 1 } }
//                let ast = AStar(data: data2)
//                let src = (srcY, srcX)
//                let dest = (destY, destX)
//                let path = ast.aStarSearch(src: src, dest: dest)
//                if let path {
//                    for i in 0..<path.count {
//                        data2[path[i].0][path[i].1] = 4
//                        line.append(CGPoint(x: path[i].1, y: path[i].0))
//                    }
//                } else {
//                    print("Got no path. Skipping path render.")
//                }
//                
//                data2[src.0][src.1] = 2
//                data2[dest.0][dest.1] = 3
                image = UIImage.colorize(data: data, ast: false)
            } label: {
                Text("Parse File").padding()
            }
            if image != nil {
                Button {
                    if let data = image?.pngData() {
                        let tmpDir = NSTemporaryDirectory()
                        let fullFileName = "\(tmpDir)moonImage.png"
                        let url = URL(fileURLWithPath: fullFileName)
                        print("file:\(fullFileName)")
                        do {
                            try data.write(to: url, options: .atomic)
                        } catch {
                            print("image file NOT written")
                        }
                    }
                } label: {
                    Text("Save Image").padding()
                }
            }
            TextField("Source X", value: $srcX, format: .number)
                .textFieldStyle(.roundedBorder)
            TextField("Source Y", value: $srcY  , format: .number)
                .textFieldStyle(.roundedBorder)
            TextField("Destination X", value: $destX, format: .number)
                .textFieldStyle(.roundedBorder)
            TextField("Destination Y", value: $destY, format: .number)
                .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
