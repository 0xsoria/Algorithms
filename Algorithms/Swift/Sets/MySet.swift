//
//  MySet.swift
//  MySet
//
//  Created by Gabriel Soria Souza on 14/09/21.
//


struct NewSet<Element: Hashable> {
    private var elements: [Element] = []
    private var hashTable = HashTable<Int, Element>(capacity: 10)
    
    var count: Int {
        self.hashTable.elementsCount
    }
    
    mutating func insert(_ element: Element) {
        self.hashTable.update(value: element, for: element.hashValue)
    }
    
    mutating func remove(_ element: Element) -> Element? {
        self.hashTable.removeValue(for: element.hashValue)
    }
}
