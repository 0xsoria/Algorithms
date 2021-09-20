//
//  Quicksort.swift
//  SortingAlgorithms
//
//  Created by Gabriel Soria Souza on 16/06/21.
//

extension Array where Element: Comparable {
    
    mutating func partitionDutchFlag(low: Int,
                                     high: Int,
                                     pivotIndex: Int) -> (Int, Int) {
        
        let pivot = self[pivotIndex]
        var smaller = low
        var equal = low
        var larger = high
        while equal <= larger {
            if self[equal] < pivot {
                self.swapAt(smaller, equal)
                smaller += 1
                equal += 1
            } else if self[equal] == pivot {
                equal += 1
            } else {
                self.swapAt(equal, larger)
                larger -= 1
            }
        }
        return (smaller, larger)
    }
    
    public mutating func quickSort(low: Int, high: Int) {
        if low < high {
            let (middleFirst, middleLast) = self.partitionDutchFlag(low: low, high: high, pivotIndex: high)
            self.quickSort(low: low, high: middleFirst - 1)
            self.quickSort(low: middleLast + 1, high: high)
        }
    }
    
    mutating func partition(leftMost: Int, rightMost: Int) {
        let pivot = self[leftMost]
        var i = leftMost + 1
        for j in (leftMost + 1)...rightMost {
            if self[j] < pivot {
                self.swapAt(j, i)
                i += 1
            }
        }
        self.swapAt(leftMost, i-1)
    }
    
    public mutating func partition(leftMost: Int, rightMost: Int, pivotIndex: Int) -> Int {
        let pivot = self[pivotIndex]
        self.swapAt(leftMost, pivotIndex)
        var i = leftMost + 1
        for j in (leftMost + 1)...rightMost {
            if self[j] < pivot {
                self.swapAt(j, i)
                i += 1
            }
        }
        self.swapAt(leftMost, i-1)
        return i - 1
    }
    
    public mutating func myQuickSort(low: Int, high: Int) {
        if high - low <= 0 {
            return
        }
        guard let pivot = (low...high).randomElement() else { return }
        let partitioned = self.partition(leftMost: low,
                                         rightMost: high,
                                         pivotIndex: pivot)
        myQuickSort(low: low, high: partitioned - 1)
        myQuickSort(low: partitioned + 1, high: high)
    }
}
