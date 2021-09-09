//
//  SortAndCount.swift
//  SortAndCount
//
//  Created by Gabriel Soria Souza on 09/09/21.
//

import Foundation

public func sortAndCountInversions(_ a: [Int], lenght: Int) -> ([Int], Int) {
    if lenght == 1 {
        return (a, 0)
    } else {
        let dividedByTwo = lenght / 2

        let firstHalf = a[0..<dividedByTwo]

        let secondHalf = a[dividedByTwo...lenght - 1]
        
        let (b, x) = sortAndCountInversions(Array(firstHalf), lenght: dividedByTwo)
        let (c, y) = sortAndCountInversions(Array(secondHalf), lenght: lenght - dividedByTwo)
        let (d, z) = countAndSplitInversion(b, c: c, totalLenght: lenght)
   
        return (d, x + y + z)
    }
}


func countAndSplitInversion(_ b: [Int], c: [Int], totalLenght: Int) -> ([Int], Int) {
    var indexB = 0
    var indexC = 0
    var returnCount = 0
    var returnArray = Array(repeating: 0, count: totalLenght)

    for k in 0..<totalLenght {
        guard indexC <= c.count - 1 else {
            returnArray[k] = b[indexB]
            indexB += 1
            continue
        }

        guard indexB <= b.count - 1 else {
            returnArray[k] = c[indexC]
            indexC += 1
            continue
        }

        if b[indexB] < c[indexC] {
            returnArray[k] = b[indexB]
            indexB += 1
        } else if  c[indexC] < b[indexB] {
            returnArray[k] = c[indexC]
            indexC += 1
            let remainingCount = b[indexB...b.count - 1].count
            returnCount += remainingCount
        }
    }

    return (returnArray, returnCount)
}
