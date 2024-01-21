//
//  UniqueString.swift
//  UniqueString
//
//  Created by Gabriel Soria Souza on 16/08/21.
//
extension String {

    func isUniqueChars() -> Bool {
        guard self.count <= 128 else {
            return false
        }
        
        //considering ASCII
        var empty = Array(repeating: false, count: 128)
        for (index, _) in self.enumerated() {
            let indexStr = self.index(self.startIndex,
                                      offsetBy: index)
            let val = Int(self[indexStr].unicodeScalars.first?.value ?? 0)
            if empty[val] {
                return false
            }
            empty[val] = true
        }
        return true
    }
    
    func isPermutationSimple(_ other: String) -> Bool {
        guard self.count == other.count else {
            return false
        }
        return other.sorted() == self.sorted()
    }
    
    func isPermutation(_ other: String) -> Bool {
        guard self.count == other.count else {
            return false
        }
        //considering ASCII
        var letters = Array(repeating: 0, count: 128)
        let arrayOfChar = Array(self)
        for ch in arrayOfChar {
            let value = Int(ch.unicodeScalars.first?.value ?? 0)
            letters[value] += 1
        }
        
        for (index, _) in other.enumerated() {
            let indexStr = other.index(other.startIndex,
                                       offsetBy: index)
            let c = other[indexStr]
            let unicodeValue = Int(c.unicodeScalars.first?.value ?? 0)
            letters[unicodeValue] -= 1
            if letters[unicodeValue] < 0 {
                return false
            }
        }
        
        return true
    }
    
    func urlfySimple() -> String {
        return self.replacingOccurrences(of: " +",
                                  with: "%",
                                  options: .regularExpression,
                                  range: nil)
    }

    public func isPalindrome() -> Bool {
        let asArray = Array(self)
        var startIndex = 0
        var lastIndex = asArray.count - 1

        while startIndex < lastIndex {
            if asArray[startIndex] != asArray[lastIndex] {
                return false
            }
            startIndex += 1
            lastIndex -= 1
        }

        return true
    }

    public func isSubsequence(of str: String) -> Bool {
        let asArray = Array(self)
        let second = Array(str)
        var i = 0
        var j = 0
        while i <= asArray.count - 1 && j <= second.count - 1 {
            if asArray[i] == second[j] {
                i += 1
            }
            j += 1
        }

        return i == asArray.count
    }
    
    public func reversed() -> Self {
        var asArray: [Character] = Array(self)
        var leftPointer = 0
        var rightPointer = asArray.count - 1

        while leftPointer < rightPointer {
            asArray.swapAt(leftPointer, rightPointer)
            leftPointer += 1
            rightPointer -= 1
        }

        return String(asArray)
    }
    
    public func pangram() -> Bool {
        guard count >= 26 else {
            return false
        }
        var setOfChars = Set<Character>()
        for i in self {
            if setOfChars.count >= 26 {
                return true
            }
            setOfChars.insert(i)
        }

        return setOfChars.count >= 26
    }
}

public func isPermutationOfPalindrome(phrase: String) -> Bool {
    var countOdd = 0
    guard let z = Character("z").unicodeScalars.first?.value,
          let a = Character("a").unicodeScalars.first?.value else {
        return false
    }
    var table: [Int] = Array(repeating: 0, count: Int(z) - Int(a) + 1)
    for c in Array(phrase.lowercased()) {
        let x = getCharNumber(c)
        if x != -1 {
            table[x] += 1
            if table[x] % 2 == 1 {
                countOdd += 1
            } else {
                countOdd -= 1
            }
        }
    }
    return countOdd <= 1
}

func getCharNumber(_ c: Character) -> Int {
    if let a = Character("a").unicodeScalars.first?.value,
       let z = Character("z").unicodeScalars.first?.value,
       let val = c.unicodeScalars.first?.value {
        if a <= val && val <= z {
            return Int(val - a)
        }
    }
    return -1
}

func oneEditAway(first: String, second: String) -> Bool {
    if first.count == second.count {
        return oneEditReplace(s1: first, s2: second)
    } else if first.count + 1 == second.count {
        return oneEditInsert(s1: first, s2: second)
    } else if first.count - 1 == second.count {
        return oneEditInsert(s1: second, s2: first)
    }
    return false
}

func oneEditReplace(s1: String, s2: String) -> Bool {
    var foundDifference = false
    for (index, _) in s1.enumerated() {
        let firstIndex = s1.index(s1.startIndex, offsetBy: index)
        let secondIndex = s2.index(s2.startIndex, offsetBy: index)
        if s1[firstIndex] != s2[secondIndex] {
            if foundDifference {
                return false
            }
            foundDifference = true
        }
    }
    return true
}

func oneEditInsert(s1: String, s2: String) -> Bool {
    var index1 = 0
    var index2 = 0
    
    while index2 < s2.count && index1 < s1.count {
        let firstIndex = s1.index(s1.startIndex, offsetBy: index1)
        let secondIndex = s2.index(s2.startIndex, offsetBy: index2)
        if s1[firstIndex] != s2[secondIndex] {
            if index1 != index2 {
                return false
            }
            index2 += 1
        } else {
            index1 += 1
            index2 += 1
        }
    }
    return true
}
