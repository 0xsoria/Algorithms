//
//  AlgorithmsTests.swift
//  AlgorithmsTests
//
//  Created by Gabriel Soria Souza on 09/09/21.
//

import XCTest
@testable import Algorithms

class AlgorithmsTests: XCTestCase {
    
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
    
    func testMergeSort() {
        let testt = [1, 4, 5, 9, 2, 3]
        let sorted = testt.mergeSort()
        XCTAssertTrue(sorted == [1, 2, 3, 4, 5, 9])
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
}
