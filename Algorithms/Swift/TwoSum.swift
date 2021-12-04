//
//  TwoSum.swift
//  Algorithms
//
//  Created by Gabriel Soria Souza on 17/11/21.
//

public func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    for index in 0 ..< nums.count {
        let complement = target - nums[index]
        
        if dict.keys.contains(complement) && dict[complement] != index {
            return [index,dict[complement]!]
        }
        dict[nums[index]] = index
        
    }
    
    return []
}
