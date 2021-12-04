//
//  Vertex.swift
//  Algorithms
//
//  Created by Gabriel Soria Souza on 09/10/21.
//

public struct Vertex<T> {
    public let data: T
}

extension Vertex: Equatable where T: Equatable {}
extension Vertex: Hashable where T: Hashable {}
