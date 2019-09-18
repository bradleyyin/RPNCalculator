//
//  DigitAccumulatorTests.swift
//  RPNTests
//
//  Created by Bradley Yin on 9/18/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation
import XCTest
import RPN

class DigitAccumulatorTests: XCTestCase {
    
    func testDigitAccumulator() throws {
        var digitAccumulator = DigitAccumulator()
        
       try digitAccumulator.add(.number(5))
       try digitAccumulator.add(.number(7))
       try digitAccumulator.add(.decimalPoint)
       try digitAccumulator.add(.number(0))
       try digitAccumulator.add(.number(3))
        
        //digitAccumulator.add(.decimalPoint) //should not appear on screen
        XCTAssertThrowsError(try digitAccumulator.add(.decimalPoint)) { (error) in
            if let error = error as? DigitAccumulatorError {
                XCTAssertEqual(DigitAccumulatorError.extraDecimalPoint, error)
            }
        }
        //get number as double
    }
}
