//
//  double.swift
//  Demo3dUI2
//
//  Created by Omay Operations on 12/1/23.
//

import Foundation

struct DoubleFile {}

extension DoubleFile {
    static func parse(fileName: String) -> [[Double]] {
        var result: [[Double]] = []

        if let url = Bundle.main.url(forResource: fileName, withExtension: "dbl") {
            do {
                let content = try String(contentsOf: url).replacingOccurrences(of: " ", with: "")
                let scanner = Scanner(string: content)

                var w: Int = 0
                var h: Int = 0

                scanner.scanInt(&w)
                scanner.scanInt(&h)

                var y = 0
                while !scanner.isAtEnd {
                    if (y % w) == 0 {
                        result.append([])
                    }

                    if let value = scanner.scanDouble() {
                        result[y / w].append(value)
                    }

                    y += 1
                }
            } catch {
                print("Unable to load file.")
            }
        }

        return result
    }

    static func fromCSV(fileName: String) -> [[Double]] {
        var result: [[Double]] = []

        if let url = Bundle.main.url(forResource: fileName, withExtension: "csv") {
            do {
                let content = try String(contentsOf: url).replacingOccurrences(of: " ", with: "")
                let scanner = Scanner(string: content)
                scanner.charactersToBeSkipped = .whitespaces

                while !scanner.isAtEnd {
                    var row: [Double] = []

                    // Scan each element in a row separated by a comma
                    while let value = scanner.scanDouble() {
                        row.append(value)

                        // Skip the comma
                        scanner.scanString(",")
                    }

                    result.append(row)

                    // Skip the newline character
                    scanner.scanString("\n")
                }
            } catch {
                print("Unable to load file.")
                return []
            }
        }

        return result
    }

}
