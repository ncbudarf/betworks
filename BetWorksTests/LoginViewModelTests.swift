//
//  LoginViewModelTests.swift
//  LoginViewModelTests
//
//  Created by Noah budarf on 2021-01-05.
//

import XCTest
@testable import BetWorks

class LoginViewModelTests: XCTestCase {
	var loginViewModel: LoginViewModel = LoginViewModel(dependencies: Dependencies())

	func testViewModelValidationUsername() {
		let result = loginViewModel.validate(input: "noah2")
		XCTAssertTrue(result, "Username 'noah2' is not valid")
	}

	func testViewModelValidationMissingLetters() {
		let result = loginViewModel.validate(input: "222")
		XCTAssertFalse(result, "Validate does not catch case of missing letters")
	}

	func testViewModelValidationMissingNumbers() {
		let result = loginViewModel.validate(input: "aaa")
		XCTAssertFalse(result, "Validate does not catch case of missing numbers")
	}

	func testViewModelValidationInsufficientLength() {
		var result = loginViewModel.validate(input: "1")
		XCTAssertFalse(result, "Validate does not catch case of being too short (number)")

		result = loginViewModel.validate(input: "a")
		XCTAssertFalse(result, "Validate does not catch case of being too short (letter)")
	}

	func testViewModelValidationEmpty() {
		let result = loginViewModel.validate(input: "")
		XCTAssertFalse(result, "Validate does not catch case of empty text field")
	}

	func testViewModelValidationWhitespaces() {
		let result = loginViewModel.validate(input: "   ")
		XCTAssertFalse(result, "Validate does not catch case of just white spaces")
	}

}
