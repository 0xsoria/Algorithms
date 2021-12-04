//
//  Visit.swift
//  Algorithms
//
//  Created by Gabriel Soria Souza on 12/10/21.
//

public enum Visit<T: Hashable> {
    case start
    case edge(Edge<T>)
}
