//
//  DigitAccumulator.swift
//  RPN
//
//  Created by Bradley Yin on 9/18/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation

public enum Digit: Equatable {
    case decimalPoint
    case number(Int)
}

public enum DigitAccumulatorError: Error {
    case extraDecimalPoint
    case invalidNumber
}

public struct DigitAccumulator {
    
    private var digits: [Digit] = []
    public init () {
        
    }
    
    public mutating func add(_ digit: Digit) throws {
        switch digit {
        case .decimalPoint:
            if digits.contains(.decimalPoint) {
                throw DigitAccumulatorError.extraDecimalPoint
            }
        default:
            print("Other")
        }
        
        
        digits.append(digit)
    }
}
