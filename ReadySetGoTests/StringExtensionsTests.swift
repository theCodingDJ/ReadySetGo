//
//  StringExtensionsTests.swift
//  ReadySetGoTests
//
//  Created by Lyubomir Marinov on 1.09.24.
//

import XCTest

final class StringExtensionsTests: XCTestCase {
    
    enum TestValues {
        static let invalid = "DS"
        static let valid = "BMW"
        static let customLength = "Nineteen characters"
    }

    func testInvalidStringValidation() {
        let testTarget = TestValues.invalid.isValid()
        
        XCTAssertFalse(testTarget, "The string should be invalid.")
    }

    func testValidStringValidation() {
        let testTarget = TestValues.valid.isValid()
        
        XCTAssertTrue(testTarget, "The string should be valid.")
    }

    func testCustomLengthStringValidation() {
        let testTarget = TestValues.customLength.isValid(minimumLength: 19)
        
        XCTAssertTrue(testTarget, "The string should be valid.")
    }
}
