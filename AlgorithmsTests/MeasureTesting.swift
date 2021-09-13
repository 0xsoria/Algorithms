//
//  MeasureTesting.swift
//  MeasureTesting
//
//  Created by Gabriel Soria Souza on 09/09/21.
//

import XCTest
@testable import Algorithms

class MeasureTesting: XCTestCase {

    let values = [8, 2, 10, 9, 5, 11, 6, 1, 7, 3, 4]

    func testSelectionSort() {
        var list = values.map { Int32($0) }
        measure {
            selectionSort(&list, Int32(0), Int32(list.count - 1))
            XCTAssertTrue(list == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
        }
    }
    
    func testInsertionSortMeasure() {
        measure {
            let array = [8, 2, 10, 9, 5, 11, 6, 1, 7, 3, 4]
            let sorted = array.insertSort()
            XCTAssertTrue(sorted == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
        }
    }
    
    func testInsertSortCPPMeasure() {
        measure {
            let array = InsertSortCPP(arrayWithValues: self.values)
            let sorted = array.insertSort()
            let sortedArray = sorted as! Array<Int>
            XCTAssertTrue(sortedArray == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
        }
    }
    
    func testInsertSortOBJCMeasure() {
        measure {
            let array = InsertSortOBJC(arrayWithValues: self.values)
            let sorted = array.insertSort()
            let sortedArray = sorted as! Array<Int>
            XCTAssertTrue(sortedArray == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
        }
    }
    
    func testNormalSort() {
        measure {
            let array = [8, 2, 10, 9, 5, 11, 6, 1, 7, 3, 4]
            let sorted = array.sorted()
            XCTAssertTrue(sorted == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
        }
    }

}
