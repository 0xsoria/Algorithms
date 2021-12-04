//
//  Edge.swift
//  Algorithms
//
//  Created by Gabriel Soria Souza on 09/10/21.
//

public struct Edge<T> {
    public let source: Vertex<T>
    public let destination: Vertex<T>
    public let weight: Double?
}
