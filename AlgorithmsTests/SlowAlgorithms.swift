//
//  SlowAlgorithms.swift
//  AlgorithmsTests
//
//  Created by Gabriel Soria Souza on 01/10/21.
//

import XCTest
@testable import Algorithms

class SlowAlgorithms: XCTestCase {
    
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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    
    func testQuickSortWithSut() {
        var sut = self.makeSut()
        sut.myQuickSort(low: 0, high: sut.count - 1)
        XCTAssertTrue(sut.first! == 1)
        XCTAssertTrue(sut.last! == 100000)
    }
}
