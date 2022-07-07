//
//  ValidationServiceTests.swift
//  DigitalAccountTests
//
//  Created by Cai on 7/7/22.
//

import XCTest
@testable import DigitalAccount

// test a validation module
class ValidationServiceTests: XCTestCase {

    // open up a validation service and test here
    var validation: ValidationService!
    
    override func setUp() {
        super.setUp()
        validation = ValidationService()
    }
    
    override func tearDown() {
        validation = nil
        super.tearDown()
    }
    
    // simple tests for username
    func test_validateUsername() throws {
        XCTAssertNoThrow(try validation.validateUsername("Cai Hong"))
        XCTAssertThrowsError(try validation.validateUsername("Ca"))
    }
    
    // simple tests for password
    func test_validatePassword() throws {
        XCTAssertNoThrow(try validation.validatePassword("Password123"))
        XCTAssertThrowsError(try validation.validatePassword(nil))
    }
}
