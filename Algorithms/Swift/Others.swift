import Foundation

/*
 * Complete the 'reverseArray' function below.
 *
 * The function is expected to return an INTEGER_ARRAY.
 * The function accepts INTEGER_ARRAY a as parameter.
 */

//O(n)
func reverseArray(a: [Int]) -> [Int] {
    // Write your code here
    var output = [Int]()
    var limit = a.count - 1
    
    while (limit >= 0) {
        output.append(a[limit])
        limit -= 1
    }
    
    return output
}

/*
 * Complete the 'hourglassSum' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts 2D_INTEGER_ARRAY arr as parameter.
 */

func hourglassSum(arr: [[Int]]) -> Int {
    var topRow = 0
    var bottomRow = 2
    var highestSum = Int.min
    var topStarts = 0
    var middleColumn = 1
    var middleRow = 1
    
    while bottomRow <= 5 {
        while topStarts <= 3 {
            var currentSum = 0
    
            for i in topStarts...topStarts + 2 {
                currentSum += arr[topRow][i]
            }
            
            //middle
            currentSum += arr[middleRow][middleColumn]
            
            for i in topStarts...topStarts + 2 {
                currentSum += arr[bottomRow][i]
            }

            if currentSum > highestSum {
                highestSum = currentSum
            }
            print(currentSum)
            print(highestSum)
            topStarts += 1
            middleColumn += 1
        }
        topStarts = 0
        middleColumn = 1
        middleRow += 1
        topRow += 1
        bottomRow += 1
    }

    return highestSum
}

public func checkForTarget(nums: [Int], target: Int) -> Bool {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let currentSum = nums[left] + nums[right]
        if currentSum == target {
            return true
        }
        
        if currentSum > target {
            right -= 1
        } else {
            left += 1
        }
    }

    return false
}

public extension Array where Element: Comparable {
    func combine(with array: [Element]) -> Self {
        var returnData = [Element]()
        var i = 0
        var j = 0

        while i <= self.count - 1 && j <= array.count - 1 {
            if self[i] < array[j] {
                returnData.append(self[i])
                i += 1
            } else {
                returnData.append(array[j])
                j += 1
            }
        }
        
        while i <= self.count - 1 {
            returnData.append(self[i])
            i += 1
        }
        
        while j <= array.count - 1 {
            returnData.append(array[j])
            j += 1
        }

        return returnData
    }
}

func sortedSquares(_ nums: [Int]) -> [Int] {
    var leftPointer = 0
    var rightPointer = nums.count - 1
    let n = nums.count - 1
    
    var returnArray = Array(repeating: 0, count: nums.count)
    for i in 0...n {
        if abs(nums[leftPointer]) < abs(nums[rightPointer]) {
            returnArray[(nums.count - 1) - i] = nums[rightPointer] * nums[rightPointer]
            rightPointer -= 1
        } else {
            returnArray[(nums.count - 1) - i] = nums[leftPointer] * nums[leftPointer]
            leftPointer += 1
        }
    }

    return returnArray
}

public func twoSumNotSorted(nums: [Int], target: Int) -> [Int] {
    var dic = [Int: Int]()
    for i in 0..<nums.count {
        let num = nums[i]
        let complement = target - num
        if dic[complement] != nil {
            return [i, dic[complement]!]
        }
        dic[num] = i
    }

    return []
}

public func firstRepeatedCharacter(_ s: String) -> Character {
    var seen = Set<Character>()
    for char in s {
        if seen.contains(char) {
            return char
        }
        seen.insert(char)
    }

    return Character(" ")
}

public func findNumbers(nums: [Int]) -> [Int] {
    var ans = [Int]()
    let numSet = Set(nums)
    
    for num in numSet {
        if !numSet.contains(num + 1) && !numSet.contains(num - 1) {
            ans.append(num)
        }
    }
    
    return ans
}

public func missingNumber(_ nums: [Int]) -> Int {
    let set = Set(nums)
    
    for i in 0...nums.count {
        guard set.contains(i) else {
            return i
        }
    }
    
    fatalError()
}

public func countElements(_ arr: [Int]) -> Int {
    let set = Set(arr)
    var count = 0

    for num in arr {
        if set.contains(num + 1) {
            count += 1
        }
    }

    return count
}
