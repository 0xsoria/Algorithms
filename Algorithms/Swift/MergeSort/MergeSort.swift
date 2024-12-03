//
//  MergeSort.swift
//  MergeSort
//
//  Created by Gabriel Soria Souza on 13/09/21.
//

import Foundation

extension Array where Element: Comparable {
    func mergeSort() -> [Element] {
        if self.count == 1 {
            return self
        } else {
            let divideByTwo = self.count / 2
            let firstHalf = self[0..<divideByTwo]
            let secondHalf = self[divideByTwo...self.count - 1]
            
            let b = Array(firstHalf).mergeSort()
            let c = Array(secondHalf).mergeSort()
            let d = self.mergeArrays(b, c: c)
            
            return d
        }
    }
    
    private func mergeArrays(_ b: [Element], c: [Element]) -> [Element] {
        var indexB = 0
        var indexC = 0
        var returnArray = Array(repeating: b.first!, count: b.count + c.count)
        
        for k in 0..<returnArray.count {
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
            } else if c[indexC] < b[indexB] {
                returnArray[k] = c[indexC]
                indexC += 1
            } else if c[indexC] == b[indexB] {
                returnArray[k] = c[indexC]
                indexC += 1
            }
        }
        return returnArray
    }
    
    func bruteForceSort() -> [Element] {
        var returnArray = self

        for i in 0..<returnArray.count {
            for j in i + 1..<returnArray.count {
                if returnArray[i] > returnArray[j] {
                    let temp = returnArray[i]
                    returnArray[i] = returnArray[j]
                    returnArray[j] = temp
                }
            }
        }

        return returnArray
    }
}

