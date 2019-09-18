//
//  StackTests.swift
//  RPNTests
//
//  Created by Bradley Yin on 9/18/19.
//  Copyright © 2019 bradleyyin. All rights reserved.
//

import Foundation
import XCTest
import RPN

//For framework dont use @testable, we can test public/ internal/ private better as an API consumer

class StackTests: XCTestCase {
    
    func testStack() {
        //FILO: first in last out
        
        var stack: Stack<Int> = [1, 2, 3] //expressibleBy Array literal
        //push = add item
        stack.push(5)
        // pop = pop item and return
        XCTAssertEqual(5, stack.pop())
        //peek = look at last item
        XCTAssertEqual(3, stack.peek())
        
        XCTAssertEqual(3, stack.pop())
        XCTAssertEqual(2, stack.pop())
        XCTAssertEqual(1, stack.pop())
        XCTAssertEqual(nil, stack.pop())
        
        XCTAssertEqual(nil, stack.peek())
    }
    
}
