//
//  CalculatorTests.swift
//  RPNTests
//
//  Created by Bradley Yin on 9/18/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation
import XCTest
import RPN

class CalculatorTests: XCTestCase {
    func testCalculatorAdd() {
        var calculator = Calculator()
        //        Calculator.Operator.add
        
        calculator.push(number: 7)
        calculator.push(number: 3)
        calculator.push(operator: .add)
        
        XCTAssertEqual(10, calculator.topValue)
    }
    
    // TODO: Add tests for other operators
    
    func testClearResetsCalculatorToNil() {
        var calculator = Calculator()
        calculator.push(number: 7)
        calculator.push(number: 3)
        
        calculator.clear()
        
        XCTAssertNil(calculator.topValue)
    }
}
