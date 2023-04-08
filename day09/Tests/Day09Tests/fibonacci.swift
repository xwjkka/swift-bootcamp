//
//  fibonacci.swift
//  
//
//  Created by Olesya Khurmuzakiy on 25.03.2023.
//

import XCTest
@testable import Day09

final class fibonacci: XCTestCase {

    var calc = SimpleCalculator()
    
    func testExample() throws {
        XCTAssertEqual(calc.fibonacci(n: 1), 1)
        XCTAssertEqual(calc.fibonacci(n: 6), 8)
        XCTAssertEqual(calc.fibonacci(n: -6), 0)
    }
}
