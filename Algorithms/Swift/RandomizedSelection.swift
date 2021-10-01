//
//  RandomizedSelection.swift
//  Algorithms
//
//  Created by Gabriel Soria Souza on 30/09/21.
//

extension Array where Element: Comparable {
    public mutating func randomizedSelection(low: Int, high: Int, order: Int) -> Element? {
        if high - low <= 0 {
            return self[order]
        }
        guard let pivot = (low...high).randomElement() else { return nil }
        let partitioned = self.partition(leftMost: low,
                                         rightMost: high,
                                         pivotIndex: pivot)
        if partitioned == order {
           return self[partitioned]
        } else if partitioned > order {
            return randomizedSelection(low: low, high: partitioned - 1, order: order)
        } else if partitioned < order {
            return randomizedSelection(low: partitioned + 1, high: high, order: order)
        }
        return nil
    }
}
