//
//  BubbleSort.swift
//  SortingAlgorithms
//
//  Created by Gabriel Sória Souza on 14/06/21.
//


extension Array where Element: Comparable {
    
    func bubbleSort() -> Array<Element> {
        guard self.count > 1 else {
            return self
        }
        
        var output: Array<Element> = self
        
        for index in 0..<self.count {
            let passes = (output.count - 1) - index
            
            for secondIndex in 0..<passes {
                let key = output[secondIndex]
                
                if (key > output[secondIndex + 1]) {
                    output.swapAt(secondIndex, secondIndex + 1)
                }
            }
        }
        return output
    }
}
