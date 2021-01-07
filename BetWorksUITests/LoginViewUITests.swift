//
//  BetWorksUITests.swift
//  BetWorksUITests
//
//  Created by Noah budarf on 2021-01-05.
//

import XCTest

class LoginViewUITests: XCTestCase {

	var app: XCUIApplication!
	override func setUp() {
		super.setUp()
		app = XCUIApplication()
		app.launch()
		continueAfterFailure = false
	}

	func testOpenLoginView() {
		let loginView = app.otherElements["LOGIN_VIEW"]
		XCTAssertTrue(loginView.exists, "LoginView view is not displayed")
	}

	func testOpenWelcomeBackView() {
		let labelText = "Welcome To Firefly!"
		let typeLabel = app.staticTexts["WELCOME_BACK_TEXT"]
		XCTAssertTrue(typeLabel.exists, "Welcome Back Text view is not displayed")
		XCTAssertEqual(typeLabel.label, labelText, "Label is missing the value '\(labelText)'")
	}

	func testOpenUsernameView() {
		let textToType = "SomeName"
		let textField = app.textFields["USERNAME_FIELD"]
		XCTAssertTrue(textField.exists, "Username Field view is not displayed")
		textField.tap()
		textField.typeText(textToType)
	}

	func testOpenPasswordView() {
		let textToType = "SomePassword"
		let secureTextField = app.secureTextFields["PASSWORD_FIELD"]
		XCTAssertTrue(secureTextField.exists, "Password Field view is not displayed")
		secureTextField.tap()
		secureTextField.typeText(textToType)
	}

	func testOpenLoginButtonView() {
		let loginButton = app.buttons["LOGIN_BUTTON"]
		XCTAssertTrue(loginButton.exists, "Login Button view is not displayed")
		loginButton.tap()
	}

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
