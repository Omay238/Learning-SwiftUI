//
//  ExtImage.swift
//  ParseCSV2
//
//  Created by Allen Norskog on 10/30/23.
//

import Foundation
import UIKit

extension UIImage {

    var pixelWidth: Int {
        return cgImage?.width ?? 0
    }

    var pixelHeight: Int {
        return cgImage?.height ?? 0
    }

}

// https://stackoverflow.com/questions/30958427/pixel-array-to-uiimage-in-swift

struct PixelData {
    var a: UInt8
    var r: UInt8
    var g: UInt8
    var b: UInt8
}

extension UIImage {
    convenience init?(pixels: [PixelData], width: Int, height: Int) {
        guard width > 0 && height > 0, pixels.count == width * height else { return nil }
        var data = pixels
        guard let providerRef = CGDataProvider(data: Data(bytes: &data, count: data.count * MemoryLayout<PixelData>.size) as CFData)
        else { return nil }
        guard let cgim = CGImage(
            width: width,
            height: height,
            bitsPerComponent: 8,
            bitsPerPixel: 32,
            bytesPerRow: width * MemoryLayout<PixelData>.size,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedFirst.rawValue),
            provider: providerRef,
            decode: nil,
            shouldInterpolate: true,
            intent: .defaultIntent)
        else { return nil }
        self.init(cgImage: cgim)
    }
}

extension UIImage {
    static let slopeBlue = PixelData(a: 255, r: 0, g: 0, b: 128)
    static let slopeGreen = PixelData(a: 255, r: 0, g: 128, b: 0)
    static let slopeOrange = PixelData(a: 255, r: 255, g: 128, b: 0)
    static let slopeRed = PixelData(a: 255, r: 255, g: 0, b: 0)
    static let slopeWhite = PixelData(a: 255, r: 255, g: 255, b: 255)
    static let slopeBlack = PixelData(a: 255, r: 0, g: 0, b: 0)
    static let slopeYellow = PixelData(a: 255, r: 192, g: 192, b: 0)

    static func colorSlope(_ value: Double) -> PixelData {
//        if value < 5 {
//            return slopeBlue
//        } else if value < 10 {
//            return slopeGreen
//        } else if value < 15 {
//            return slopeOrange
//        } else {
//            return slopeRed
//        }
        if value >= 15 {
            return slopeBlack
        } else {
            return slopeWhite
        }
    }
    
    static func colorAStar(_ value: Int) -> PixelData {
        if value == 0 { // blocked
            return slopeBlack
        } else if value == 1 { // empty
            return slopeWhite
        } else if value == 2 { // start
            return slopeGreen
        } else if value == 3 { // end
            return slopeRed
        } else if value == 4 { // path
            return slopeYellow
        } else {
            return slopeWhite
        }
    }

    static func colorize(data: [[Double]], ast: Bool) -> UIImage? {
        var pixelData: [PixelData] = []
        let numRows = data.count
        if numRows < 1 {
            print("ERROR: No data!")
            return nil
        }
        let numCols = data[0].count
        for i in 0..<numRows {
            if data[i].count != numCols {
                print("ERROR: Bad column count for row: \(i)!")
                return nil
            }
        }

        for i in 0..<numRows {
            for j in 0..<numCols {
                if ast {
//                    pixelData.append(UIImage.colorAStar(data[i][j]))
                } else {
                    pixelData.append(UIImage.colorSlope(data[i][j]))
                }
            }
        }
        return UIImage(pixels: pixelData, width: numCols, height: numRows)
    }

}
