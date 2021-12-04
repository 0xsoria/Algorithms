//
//  BinarySearchTree.swift
//  Algorithms
//
//  Created by Gabriel Soria Souza on 15/11/21.
//

import Foundation

public class BinaryNode<Element: Comparable> {
    public var value: Element
    public weak var parent: BinaryNode<Element>?
    public var leftChild: BinaryNode<Element>?
    public var rightChild: BinaryNode<Element>?
    
    public init(value: Element) {
        self.value = value
    }
    
    public var min: BinaryNode {
        leftChild?.min ?? self
    }
    
    public var max: BinaryNode {
        rightChild?.max ?? self
    }
    
    public var predecessor: BinaryNode? {
        if let leftChild = leftChild {
            return leftChild.max
        }
        
        if let parent = self.parent,
           let pred = self.predecessorValueFromParentValue(value: self.value,
                                                           from: parent) {
            return pred
        }
        
        return nil
    }
    
    private func predecessorValueFromParentValue(value: Element,
                                                 from parentNode: BinaryNode<Element>) -> BinaryNode<Element>? {
        if parentNode.value < value {
            return parentNode
        } else if let parentParent = parentNode.parent {
            return predecessorValueFromParentValue(value: value, from: parentParent)
        } else {
            return nil
        }
    }
}

public class BinarySearchTree<Element: Comparable> {
    public var root: BinaryNode<Element>?
    
    public init() {}
    
    public func insert(value: Element) {
        self.root = insert(from: root, value: value)
    }
    
    public func remove(value: Element) {
        self.root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        if value == node.value {
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            if node.leftChild == nil {
                return node.rightChild
            }
            if node.rightChild == nil {
                return node.leftChild
            }
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        return node
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value: value)
        }
        
        if node.value < value {
            node.rightChild = insert(from: node.rightChild, value: value)
        } else {
            node.leftChild = insert(from: node.leftChild, value: value)
        }
        return node
    }
    
    public func search(element: Element, from node: BinaryNode<Element>) -> BinaryNode<Element>? {
        if node.value == element {
            return node
        } else if node.value < element, let rightChild = node.rightChild {
            return search(element: element, from: rightChild)
        } else if node.value > element, let leftChild = node.leftChild {
            return search(element: element, from: leftChild)
        }
        
        return nil
    }
}
