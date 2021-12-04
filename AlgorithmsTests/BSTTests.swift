//
//  BSTTests.swift
//  AlgorithmsTests
//
//  Created by Gabriel Soria Souza on 15/11/21.
//

import XCTest
@testable import Algorithms

class BSTTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTwoSum() {
        var input = [2, 7, 11, 15]
        var returnValue = twoSum(input, 9)
        XCTAssertTrue(returnValue == [1, 0])
    }
    
     func testHeapp() {
        var heap = Heap(sort: <, elements: [4, 4, 8, 9, 4, 12, 9, 11, 13])
        heap.insert(1)
        print(heap)
    }
    
    func testHeap() {
        var heap = Heap(sort: <, elements: [4, 4, 8, 9, 4, 12, 9, 11, 13])
        var removed = heap.remove()
        print(removed)
        var removed2 = heap.remove()
        print(removed2)
        var removed3 = heap.remove()
        print(removed3)
    }
    
    func testSearch() {
        let tree = BinarySearchTree<Int>()
        let root = BinaryNode(value: 3)
        let one = BinaryNode(value: 1)
        let two = BinaryNode(value: 2)
        let four = BinaryNode(value: 4)
        let five = BinaryNode(value: 5)
        tree.root = root
        root.leftChild = one
        one.parent = root
        one.rightChild = two
        two.parent = one
        root.rightChild = five
        five.parent = root
        five.leftChild = four
        four.parent = five
        let twoSearch = tree.search(element: 2, from: root)
        XCTAssertNotNil(twoSearch)
    }
}
