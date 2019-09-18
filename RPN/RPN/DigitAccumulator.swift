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
    public var value: Double? {
        let numberString = digits.map { digit -> String in
            switch digit {
            case .number(let value):
                return String(value)
            case .decimalPoint:
                return "."
            }
        }.joined()
        
        return Double(numberString)
    }
    
    public mutating func add(_ digit: Digit) throws {
        switch digit {
        case .decimalPoint:
            if digits.contains(.decimalPoint) {
                throw DigitAccumulatorError.extraDecimalPoint
            }
        case .number(let value):
            if value > 9 || value < 0 {
                throw DigitAccumulatorError.invalidNumber
            }
        }
        
        
        digits.append(digit)
    }
}
