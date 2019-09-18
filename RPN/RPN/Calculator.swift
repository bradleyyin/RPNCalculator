//
//  Calculator.swift
//  RPN
//
//  Created by Bradley Yin on 9/18/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation

public struct Calculator: CustomStringConvertible {
    
    // operations
    public enum Operator {
        case add
        case subtract
        case multiply
        case divide
        //        case percentage // @unknown default
    }
    
    private var stack: Stack<Double> = []
    
    public var description: String {
        return "Stack: \(stack)"
    }
    
    public var topValue: Double? {
        return stack.peek()
    }
    
    public var stackCount: Int {
        return stack.count
    }
    
    public init() {
        
    }
    
    // add digit
    public mutating func push(number: Double) {
        stack.push(number)
    }
    
    // add operator
    public mutating func push(operator: Operator) {
        // pop 2 elements
        // process the operation on elements
        //  push the result on the stack
        //        print(self)
        guard stack.count >= 2, // must have 2 items to perform an operation
            let rhsOperand = stack.pop(),
            let lhsOperand = stack.pop() else { return }
        
        var result: Double = 0.0
        
        switch `operator` {
            
        case .add:
            result = lhsOperand + rhsOperand
        case .subtract:
            result = lhsOperand - rhsOperand
        case .multiply:
            result = lhsOperand * rhsOperand
        case .divide:
            result = lhsOperand / rhsOperand
            //        @unknown default:
            //            print("Not supported")
        }
        stack.push(result)
    }
    
    
    public mutating func clear() {
        stack = []
    }
    
    
}
