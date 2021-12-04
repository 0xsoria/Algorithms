//
//  Stack.swift
//  Algorithms
//
//  Created by Gabriel Soria Souza on 10/10/21.
//

public struct Stack<Element> {
    
    private var storage: [Element] = []
    
    public init() { }
    
    public init(_ elements: [Element]) {
        self.storage = elements
    }

    public mutating func push(_ element: Element) {
        self.storage.append(element)
    }

    @discardableResult
    public mutating func pop() -> Element? {
        self.storage.popLast()
    }

    public func peek() -> Element? {
        self.storage.last
    }

    public var isEmpty: Bool {
        self.peek() == nil
    }
}
