//
//  InsertSort.swift
//  SortingAlgorithms
//
//  Created by Gabriel Sória Souza on 13/06/21.
//

extension Array where Element: Comparable {
    func insertSort() -> Array<Element> {
        guard !self.isEmpty else {
            return self
        }

        var output = self
        
        for index in 0..<output.count {
            let key = output[index]
            var secondaryIndex = index
            
            while secondaryIndex > -1 {
                if key < output[secondaryIndex] {
                    output.remove(at: secondaryIndex + 1)
                    output.insert(key, at: secondaryIndex)
                }
                secondaryIndex -= 1
            }
        }
        return output
    }
}
