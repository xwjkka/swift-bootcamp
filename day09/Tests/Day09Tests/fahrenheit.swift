//
//  fahrenheit.swift
//  Day09Tests
//
//  Created by Olesya Khurmuzakiy on 24.03.2023.
//

import XCTest
@testable import Day09

final class fahrenheit: XCTestCase {

    var calc = SimpleCalculator()
    
    
    func testExample() throws {
        XCTAssertEqual(calc.fahrenheit(celcius: 32), 89.6)
        XCTAssertEqual(calc.fahrenheit(celcius: 0), 32)
        XCTAssertEqual(calc.fahrenheit(celcius: 235.556), 456.0008)
    }

}
