//
//  CSV.swift
//  ParseCSV2
//
//  Created by Allen Norskog on 10/30/23.
//

import Foundation

struct CSV {

}

extension CSV {
    static func parse(fileName: String) -> [[Int]] {
        var result: [[Int]] = []
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "csv") {
            do {
                let s = try String(contentsOf: url).replacingOccurrences(of: " ", with: "")
                let lines = s.split(whereSeparator: \.isNewline)
                
                for line in lines {
                    var row: [Int] = []
                    let columns = line.split(separator: ",")
                    for column in columns {
                        if let num = Double(column) {
                            row.append(Int(num))
                        }
                    }
                    result.append(row)
                }
            } catch {
                print("Unable to load file.")
            }
        }
        
        return result
    }

}
