//
//  circle.swift
//  Day09Tests
//
//  Created by Olesya Khurmuzakiy on 24.03.2023.
//

import XCTest
@testable import Day09

final class circle: XCTestCase {

    var calc = SimpleCalculator()
    
    
    func testExample() throws {
        XCTAssertEqual(calc.circleArea(radius: 9), 254.34)
        XCTAssertEqual(calc.circleArea(radius: 3.14), 30.959144000000002)
        XCTAssertEqual(calc.circleArea(radius: 0), 0)
    }

}
