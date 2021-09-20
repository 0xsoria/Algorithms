//
//  AlgorithmsTests.swift
//  AlgorithmsTests
//
//  Created by Gabriel Soria Souza on 09/09/21.
//

import XCTest
@testable import Algorithms

class AlgorithmsTests: XCTestCase {
    
    func makeSut() -> [Int] {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "Inversions", withExtension: "txt")
        assert(url != nil)
        let data = try? String(contentsOfFile: url!.path, encoding: .utf8)
        assert(data != nil)
        let dataSet = data!.components(separatedBy: .newlines).compactMap {
            Int($0)
        }
        return dataSet
    }
    
    func testNewPartition() {
        var newPar = [5, 2, 3, 4]
        newPar.myQuickSort(low: 0, high: newPar.count - 1)
        XCTAssertTrue(newPar == [2, 3, 4, 5])
    }
    
    func testQuickSortWithSut() {
        var sut = self.makeSut()
        sut.myQuickSort(low: 0, high: sut.count - 1)
        XCTAssertTrue(sut.first! == 1)
        XCTAssertTrue(sut.last! == 100000)
    }
    
    func testSortAndCountInversion() {
        let result = sortAndCountInversions([10, 11, 12, 1, 2, 3], lenght: 6)
        XCTAssertTrue(result.0 == [1, 2, 3, 10, 11, 12])
        XCTAssertTrue(result.1 == 9)
    }

    func testKaratsuba() {
        let karatsuba = karatsuba(100000, by: 100000)
        let multiply = multiply("100000", by: "100000")
        XCTAssertTrue(100000 * 100000 == karatsuba)
        XCTAssertTrue(Int(multiply)! == 100000 * 100000)
    }
    
    func testPartition() {
        var sut = [3, 8, 2, 5, 1, 4, 7, 6]
        sut.partition(leftMost: 0, rightMost: 7)
        print(sut)
        XCTAssertTrue(sut == [1, 2, 3, 5, 8, 4, 7, 6])
    }
    
    func testAnotherPartition() {
        var sut = [3, 8, 2, 5, 1, 4, 7, 6]
        sut.partition(leftMost: 0, rightMost: 7)
        print(sut)
        XCTAssertTrue(sut == [1, 2, 3, 5, 8, 4, 7, 6])
    }
    
    func testMergeSort() {
        let testt = [1, 4, 5, 9, 2, 3]
        let sorted = testt.mergeSort()
        XCTAssertTrue(sorted == [1, 2, 3, 4, 5, 9])
    }
    
    func testMergeEqual() {
        let testt = [1, 9, 4, 3, 2, 1, 1]
        let sorted = testt.mergeSort()
        print(sorted)
        XCTAssertTrue(sorted == [1, 1, 1, 2, 3, 4, 9])
    }
    
    func testMergeSortString() {
        let strs = ["b", "a", "n", "z", "c"]
        let sorted = strs.mergeSort()
        XCTAssertTrue(sorted == ["a", "b", "c", "n", "z"])
    }
    
    func testInversionFromBundle() {
        let bundle = Bundle(for: type(of: self))
        if let bundleURL = Bundle.main.url(forResource: "", withExtension: ""),
           let contentsOfFile = try? String(contentsOfFile: bundleURL.path, encoding: .utf8) {
            let components = contentsOfFile.components(separatedBy: .newlines)
            print(components)
        }
        let url = bundle.url(forResource: "Inversions", withExtension: "txt")
        XCTAssertNotNil(url)
        let data = try? String(contentsOfFile: url!.path, encoding: .utf8)
        XCTAssertNotNil(data)
        let dataSet = data!.components(separatedBy: .newlines).compactMap {
            Int($0)
        }
        XCTAssertFalse(dataSet.isEmpty)
        XCTAssertTrue(dataSet.count == 100000)
        let result = sortAndCountInversions(dataSet, lenght: 100000)
        XCTAssertTrue(result.0.count == 100000)
        print(result.1)
    }

    func testMySetInsertionAndRemove() {
        var mySet = NewSet<String>()
        mySet.insert("Gabriel")
        XCTAssertTrue(mySet.count == 1)
        mySet.insert("Gabriel")
        XCTAssertTrue(mySet.count == 1)
        mySet.insert("Marcela")
        XCTAssertTrue(mySet.count == 2)
        _ = mySet.remove("Gabriel")
        XCTAssertTrue(mySet.count == 1)
        _ = mySet.remove("Marcela")
        XCTAssertTrue(mySet.count == 0)
    }
}
