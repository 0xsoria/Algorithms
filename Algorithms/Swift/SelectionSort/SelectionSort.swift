//
//  SelectionSort.swift
//  SortingAlgorithms
//
//  Created by Gabriel Soria Souza on 16/06/21.
//

extension Array where Element: Comparable {
    func selectionSort() -> Array<Element> {
        guard self.count > 1 else {
            return self
        }

        var output: Array<Element> = self

        for index in 0..<output.count {
            var minimum = index
            var secondaryIndex = index + 1

            while secondaryIndex < output.count {
                if output[minimum] > output[secondaryIndex] {
                    minimum = secondaryIndex
                }
                secondaryIndex += 1
            }
            
            if index != minimum {
                output.swapAt(index, minimum)
            }
        }
        return output
    }
}
