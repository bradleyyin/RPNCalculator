//
//  Stack.swift
//  RPN
//
//  Created by Bradley Yin on 9/18/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation

public struct Stack<Element>: ExpressibleByArrayLiteral {
    
    
    var items: [Element]
    
    public var count: Int {
        return items.count
    }
    
    public init (_ array: [Element] = []) {
        self.items = array
    }
    
    public init(arrayLiteral elements: Element...) {
        self.items = elements
    }
    
    public mutating func push(_ value: Element) {
        self.items.append(value)
    }
    
    public mutating func pop() -> Element? {
        guard items.count > 0 else { return nil}
        return items.removeLast()
    }
    
    public func peek() -> Element? {
        return items.last
    }
}
