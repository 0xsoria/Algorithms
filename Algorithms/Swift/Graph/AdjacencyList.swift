//
//  AdjacencyList.swift
//  Algorithms
//
//  Created by Gabriel Soria Souza on 09/10/21.
//

public final class AdjacencyList<T: Hashable>: Graph {
    
    private var adjacencies: [Vertex<T>: [Edge<T>]] = [:]
    
    public init() {}
    
    public func createVertex(data: T) -> Vertex<T> {
        let vertex = Vertex(data: data)
        self.adjacencies[vertex] = []
        return vertex
    }
    
    public func addDirectedEdge(from source: Vertex<T>,
                                to destination: Vertex<T>,
                                weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        self.adjacencies[source]?.append(edge)
    }
    
    public func add(_ edge: EdgeType, from source: Vertex<T>, to destinatino: Vertex<T>, weight: Double?) {
        switch edge {
        case .directed:
            self.addDirectedEdge(from: source, to: destinatino, weight: weight)
        case .undirected:
            self.addUndirectedEdge(between: source, and: destinatino, weight: weight)
        }
    }
    
    public func edges(from source: Vertex<T>) -> [Edge<T>] {
        self.adjacencies[source] ?? []
    }
    
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        self.adjacencies[source]?.first { $0.destination == destination }?.weight
    }
}

extension AdjacencyList {
    func breadFirstSearch(_ startVertex: Vertex<Element>) -> [Vertex<Element>] {
        var queue = QueueStack<Vertex<Element>>()
        var enqueued: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        
        var d = 0
        queue.enqueue(startVertex)
        enqueued.insert(startVertex)
        
        while !queue.isEmpty {
            if let v = queue.dequeue() {
                visited.append(v)
                if let edges = self.adjacencies[v] {
                    edges.forEach { edge in
                        if !enqueued.contains(edge.destination) {
                            enqueued.insert(edge.destination)
                            d += 1
                            queue.enqueue(edge.destination)
                        }
                    }
                }
            }
        }
        print(d)
        return visited
    }

    func depthFirstSearch(_ source: Vertex<Element>) -> [Vertex<Element>] {
        var stack: Stack<Vertex<Element>> = Stack()
        var pushed: Set<Vertex<Element>> = []
        var visited: [Vertex<Element>] = []
        
        stack.push(source)
        pushed.insert(source)
        visited.append(source)
        
    outer: while let vertex = stack.peek() {
        let neighbors = edges(from: vertex)
        guard !neighbors.isEmpty else {
            stack.pop()
            continue
        }
        
        for edge in neighbors {
            if !pushed.contains(edge.destination) {
                stack.push(edge.destination)
                pushed.insert(edge.destination)
                visited.append(edge.destination)
                continue outer
            }
        }
        stack.pop()
    }
        
        return visited
    }
}
