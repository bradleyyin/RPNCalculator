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
            } else {
                XCTFail()
            }
        }
        
        //get a double back
        XCTAssertEqual(57.03, digitAccumulator.value)
    }
    
    
    
    func testDoubleDigitNumberNotValid() throws {
        var digitAccumulator = DigitAccumulator()
        
        
        
        XCTAssertThrowsError(try digitAccumulator.add(.number(99))) { (error) in
            if let error = error as? DigitAccumulatorError {
                XCTAssertEqual(DigitAccumulatorError.invalidNumber, error)
            } else {
                XCTFail()
            }
        }
        
        XCTAssertThrowsError(try digitAccumulator.add(.number(-1))) { (error) in
            if let error = error as? DigitAccumulatorError {
                XCTAssertEqual(DigitAccumulatorError.invalidNumber, error)
            } else {
                XCTFail()
            }
        }
    }
}
