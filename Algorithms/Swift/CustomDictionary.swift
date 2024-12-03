//
//  CustomDictionary.swift
//  Algorithms
//
//  Created by Gabriel Soria on 03/12/2024.
//

import Foundation
/// Node for the linked list used in hash collisions
class Node<Key: Hashable, Value> {
    var key: Key
    var value: Value
    var next: Node?

    init(key: Key, value: Value, next: Node? = nil) {
        self.key = key
        self.value = value
        self.next = next
    }
}

/// Custom dictionary implementation using hash table with linked lists for collisions
class CustomDictionary<Key: Hashable, Value> {
    private var buckets: [Node<Key, Value>?]
    private(set) var count: Int = 0

    private let capacity: Int

    init(capacity: Int = 16) {
        self.capacity = max(1, capacity)
        self.buckets = Array(repeating: nil, count: self.capacity)
    }

    private func index(forKey key: Key) -> Int {
        abs(key.hashValue) % capacity
    }

    func set(value: Value, forKey key: Key) {
        let index = index(forKey: key)

        // Check if the bucket already contains a linked list
        if let head = buckets[index] {
            var current = head

            while true {
                // Update value if key already exists
                if current.key == key {
                    current.value = value
                    return
                }

                // Move to the next node or stop at the end
                if let nextNode = current.next {
                    current = nextNode
                } else {
                    break
                }
            }

            // Add a new node at the end of the list
            current.next = Node(key: key, value: value)
        } else {
            // Create a new linked list for this bucket
            buckets[index] = Node(key: key, value: value)
        }

        count += 1
    }

    func get(forKey key: Key) -> Value? {
        let index = index(forKey: key)
        var current = buckets[index]

        while let node = current {
            if node.key == key {
                return node.value
            }
            current = node.next
        }

        return nil
    }

    func remove(forKey key: Key) {
        let index = index(forKey: key)
        var current = buckets[index]
        var previous: Node<Key, Value>?

        while let node = current {
            if node.key == key {
                if let prev = previous {
                    prev.next = node.next
                } else {
                    buckets[index] = node.next
                }
                count -= 1
                return
            }
            previous = current
            current = node.next
        }
    }

    func allKeys() -> [Key] {
        var keys: [Key] = []

        for bucket in buckets {
            var current = bucket
            while let node = current {
                keys.append(node.key)
                current = node.next
            }
        }

        return keys
    }

    func allValues() -> [Value] {
        var values: [Value] = []

        for bucket in buckets {
            var current = bucket
            while let node = current {
                values.append(node.value)
                current = node.next
            }
        }

        return values
    }
}
