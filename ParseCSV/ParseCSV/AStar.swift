//
//  astar.swift
//  ParseCSV
//
//  Created by Omay Operations on 11/9/23.
//

import Foundation

func manhattanDist(_ pos1: (Int, Int), _ pos2: (Int, Int)) -> Double {
    return Double(abs(pos1.0 - pos2.0) + abs(pos1.1 - pos2.1))
}

func diagonalDist(_ pos1: (Int, Int), _ pos2: (Int, Int)) -> Double {
    let dx = abs(pos1.0 - pos2.0)
    let dy = abs(pos1.1 - pos2.1)
    
    return Double(dx + dy) + (1.414 - 2) * Double(min(dx, dy))
}

func euclideanDist(_ pos1: (Int, Int), _ pos2: (Int, Int)) -> Double {
    let dx = pos1.0 - pos2.0
    let dy = pos1.1 - pos2.1
    
    return sqrt(Double(dx * dx + dy * dy))
}

struct Cell {
    var parentI: Int
    var parentJ: Int
    var f: Double
    var g: Double
    var h: Double
}

struct AStar {
    var grid: [[Int]]
    var row: Int = 0
    var col: Int = 0
    init(data: [[Int]]) {
        self.grid = data
        self.row = data.count
        self.col = data[0].count
    }
    
    func isValid(row: Int, col: Int) -> Bool {
        return (row >= 0) && (row < self.row) && (col >= 0) && (col < self.col)
    }
    
    func isUnblocked(row: Int, col: Int) -> Bool {
        return self.grid[row][col] == 1
    }
    
    func isDestination(row: Int, col: Int, dest: (Int, Int)) -> Bool {
        return row == dest.0 && col == dest.1
    }
    
    func calculateHValue(row: Int, col: Int, dest: (Int, Int)) -> Double {
        return diagonalDist((row, col), dest)
    }
    
    func tracePath(cellDetails: [[Cell]], dest: (Int, Int)) -> [(Int, Int)] {
        var row = dest.0
        var col = dest.1
        
        var path: [(Int, Int)] = []
        
        while (!(cellDetails[row][col].parentI == row && cellDetails[row][col].parentJ == col)) {
            path.append((row, col))
            let tempRow = cellDetails[row][col].parentI
            let tempCol = cellDetails[row][col].parentJ
            row = tempRow
            col = tempCol
        }
        
        path.append((row, col))
        
        return path
    }
    
    func aStarSearch(src: (Int, Int), dest: (Int, Int)) -> [(Int, Int)]? {
        if !self.isValid(row: src.0, col: src.1) {
            print("Source is invalid")
            return nil
        }
        if !self.isValid(row: dest.0, col: dest.1) {
            print("Destination is invalid")
            return nil
        }
        if !self.isUnblocked(row: src.0, col: src.1) {
            print("Source is blocked")
            return nil
        }
        if !self.isUnblocked(row: dest.0, col: dest.1) {
            print("Destination is blocked")
            return nil
        }
        if self.isDestination(row: src.0, col: src.1, dest: dest) {
            print("Already at destination")
            return nil
        }
        
        var closedList = [[Bool]](repeating: [Bool](repeating: false, count: self.col), count: self.row)
        var cellDetails = [[Cell]](repeating: [Cell](repeating: Cell(parentI: -1, parentJ: -1, f: 2147483647, g: 2147483647, h: 2147483647), count: self.col), count: self.row)
        
        var i = src.0
        var j = src.1
        
        cellDetails[i][j] = Cell(parentI: i, parentJ: j, f: 0, g: 0, h: 0)
        
        var openList = [Double: (Int, Int)]()
        
        openList.updateValue((i, j), forKey: 0)
        
        var foundDest = false
        
        while openList.count > 0 {
            let a = openList.min(by: { $0.key < $1.key })
            
            let p = (a!.key, a!.value)
            
            openList.removeValue(forKey: p.0)
            
            i = p.1.0
            j = p.1.1
            closedList[i][j] = true
            
            var gNew: Double
            var hNew: Double
            var fNew: Double
            
            if self.isValid(row: i - 1, col: j) {
                if self.isDestination(row: i - 1, col: j, dest: dest) {
                    cellDetails[i - 1][j].parentI = i
                    cellDetails[i - 1][j].parentJ = j
                    print("The destination cell is found")
                    foundDest = true
                    return tracePath(cellDetails: cellDetails, dest: dest)
                } else if !closedList[i - 1][j] && self.isUnblocked(row: i - 1, col: j) {
                    gNew = cellDetails[i][j].g + 1
                    hNew = self.calculateHValue(row: i - 1, col: j, dest: dest)
                    fNew = gNew + hNew
                    
                    if cellDetails[i - 1][j].f == 2147483647 || cellDetails[i - 1][j].f > fNew {
                        openList.updateValue((i - 1, j), forKey: fNew)
                        
                        cellDetails[i - 1][j].f = fNew
                        cellDetails[i - 1][j].g = gNew
                        cellDetails[i - 1][j].h = hNew
                        cellDetails[i - 1][j].parentI = i
                        cellDetails[i - 1][j].parentJ = j
                    }
                }
            }
            if self.isValid(row: i + 1, col: j) {
                if self.isDestination(row: i + 1, col: j, dest: dest) {
                    cellDetails[i + 1][j].parentI = i
                    cellDetails[i + 1][j].parentJ = j
                    print("The destination cell is found")
                    foundDest = true
                    return tracePath(cellDetails: cellDetails, dest: dest)
                } else if !closedList[i + 1][j] && self.isUnblocked(row: i + 1, col: j) {
                    gNew = cellDetails[i][j].g + 1
                    hNew = self.calculateHValue(row: i + 1, col: j, dest: dest)
                    fNew = gNew + hNew
                    
                    if cellDetails[i + 1][j].f == 2147483647 || cellDetails[i + 1][j].f > fNew {
                        openList.updateValue((i + 1, j), forKey: fNew)
                        
                        cellDetails[i + 1][j].f = fNew
                        cellDetails[i + 1][j].g = gNew
                        cellDetails[i + 1][j].h = hNew
                        cellDetails[i + 1][j].parentI = i
                        cellDetails[i + 1][j].parentJ = j
                    }
                }
            }
            if self.isValid(row: i, col: j + 1) {
                if self.isDestination(row: i, col: j + 1, dest: dest) {
                    cellDetails[i][j + 1].parentI = i
                    cellDetails[i][j + 1].parentJ = j
                    print("The destination cell is found")
                    foundDest = true
                    return tracePath(cellDetails: cellDetails, dest: dest)
                } else if !closedList[i][j + 1] && self.isUnblocked(row: i, col: j + 1) {
                    gNew = cellDetails[i][j + 1].g + 1
                    hNew = self.calculateHValue(row: i, col: j + 1, dest: dest)
                    fNew = gNew + hNew
                    
                    if cellDetails[i][j + 1].f == 2147483647 || cellDetails[i][j + 1].f > fNew {
                        openList.updateValue((i, j + 1), forKey: fNew)
                        
                        cellDetails[i][j + 1].f = fNew
                        cellDetails[i][j + 1].g = gNew
                        cellDetails[i][j + 1].h = hNew
                        cellDetails[i][j + 1].parentI = i
                        cellDetails[i][j + 1].parentJ = j
                    }
                }
            }
            if self.isValid(row: i, col: j - 1) {
                if self.isDestination(row: i, col: j - 1, dest: dest) {
                    cellDetails[i][j - 1].parentI = i
                    cellDetails[i][j - 1].parentJ = j
                    print("The destination cell is found")
                    foundDest = true
                    return tracePath(cellDetails: cellDetails, dest: dest)
                } else if !closedList[i][j - 1] && self.isUnblocked(row: i, col: j - 1) {
                    gNew = cellDetails[i][j - 1].g + 1
                    hNew = self.calculateHValue(row: i, col: j - 1, dest: dest)
                    fNew = gNew + hNew
                    
                    if cellDetails[i][j - 1].f == 2147483647 || cellDetails[i][j - 1].f > fNew {
                        openList.updateValue((i, j - 1), forKey: fNew)
                        
                        cellDetails[i][j - 1].f = fNew
                        cellDetails[i][j - 1].g = gNew
                        cellDetails[i][j - 1].h = hNew
                        cellDetails[i][j - 1].parentI = i
                        cellDetails[i][j - 1].parentJ = j
                    }
                }
            }
            if self.isValid(row: i - 1, col: j + 1) {
                if self.isDestination(row: i - 1, col: j + 1, dest: dest) {
                    cellDetails[i - 1][j + 1].parentI = i
                    cellDetails[i - 1][j + 1].parentJ = j
                    print("The destination cell is found")
                    foundDest = true
                    return tracePath(cellDetails: cellDetails, dest: dest)
                } else if !closedList[i - 1][j + 1] && self.isUnblocked(row: i - 1, col: j + 1) {
                    gNew = cellDetails[i][j].g + 1.414
                    hNew = self.calculateHValue(row: i - 1, col: j + 1, dest: dest)
                    fNew = gNew + hNew
                    
                    if cellDetails[i - 1][j + 1].f == 2147483647 || cellDetails[i - 1][j + 1].f > fNew {
                        openList.updateValue((i - 1, j + 1), forKey: fNew)
                        
                        cellDetails[i - 1][j + 1].f = fNew
                        cellDetails[i - 1][j + 1].g = gNew
                        cellDetails[i - 1][j + 1].h = hNew
                        cellDetails[i - 1][j + 1].parentI = i
                        cellDetails[i - 1][j + 1].parentJ = j
                    }
                }
            }
            if self.isValid(row: i - 1, col: j - 1) {
                if self.isDestination(row: i - 1, col: j - 1, dest: dest) {
                    cellDetails[i - 1][j - 1].parentI = i
                    cellDetails[i - 1][j - 1].parentJ = j
                    print("The destination cell is found")
                    foundDest = true
                    return tracePath(cellDetails: cellDetails, dest: dest)
                } else if !closedList[i - 1][j - 1] && self.isUnblocked(row: i - 1, col: j - 1) {
                    gNew = cellDetails[i][j].g + 1.414
                    hNew = self.calculateHValue(row: i - 1, col: j - 1, dest: dest)
                    fNew = gNew + hNew
                    
                    if cellDetails[i - 1][j - 1].f == 2147483647 || cellDetails[i - 1][j - 1].f > fNew {
                        openList.updateValue((i - 1, j - 1), forKey: fNew)
                        
                        cellDetails[i - 1][j - 1].f = fNew
                        cellDetails[i - 1][j - 1].g = gNew
                        cellDetails[i - 1][j - 1].h = hNew
                        cellDetails[i - 1][j - 1].parentI = i
                        cellDetails[i - 1][j - 1].parentJ = j
                    }
                }
            }
            if self.isValid(row: i + 1, col: j + 1) {
                if self.isDestination(row: i + 1, col: j + 1, dest: dest) {
                    cellDetails[i + 1][j + 1].parentI = i
                    cellDetails[i + 1][j + 1].parentJ = j
                    print("The destination cell is found")
                    foundDest = true
                    return tracePath(cellDetails: cellDetails, dest: dest)
                } else if !closedList[i + 1][j + 1] && self.isUnblocked(row: i + 1, col: j + 1) {
                    gNew = cellDetails[i][j].g + 1.414
                    hNew = self.calculateHValue(row: i + 1, col: j + 1, dest: dest)
                    fNew = gNew + hNew
                    
                    if cellDetails[i + 1][j + 1].f == 2147483647 || cellDetails[i + 1][j + 1].f > fNew {
                        openList.updateValue((i + 1, j + 1), forKey: fNew)
                        
                        cellDetails[i + 1][j + 1].f = fNew
                        cellDetails[i + 1][j + 1].g = gNew
                        cellDetails[i + 1][j + 1].h = hNew
                        cellDetails[i + 1][j + 1].parentI = i
                        cellDetails[i + 1][j + 1].parentJ = j
                    }
                }
            }
            if self.isValid(row: i + 1, col: j - 1) {
                if self.isDestination(row: i + 1, col: j - 1, dest: dest) {
                    cellDetails[i + 1][j - 1].parentI = i
                    cellDetails[i + 1][j - 1].parentJ = j
                    print("The destination cell is found")
                    foundDest = true
                    return tracePath(cellDetails: cellDetails, dest: dest)
                } else if !closedList[i + 1][j - 1] && self.isUnblocked(row: i + 1, col: j - 1) {
                    gNew = cellDetails[i][j].g + 1.414
                    hNew = self.calculateHValue(row: i + 1, col: j - 1, dest: dest)
                    fNew = gNew + hNew
                    
                    if cellDetails[i + 1][j - 1].f == 2147483647 || cellDetails[i + 1][j - 1].f > fNew {
                        openList.updateValue((i + 1, j - 1), forKey: fNew)
                        
                        cellDetails[i + 1][j - 1].f = fNew
                        cellDetails[i + 1][j - 1].g = gNew
                        cellDetails[i + 1][j - 1].h = hNew
                        cellDetails[i + 1][j - 1].parentI = i
                        cellDetails[i + 1][j - 1].parentJ = j
                    }
                }
            }
        }
        if !foundDest {
            print("Failed to find the Destination Cell\n");
        }
        
        return nil
    }
}
