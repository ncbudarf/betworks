//
//  LoginViewModel.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-06.
//

import Foundation
import SwiftUI

protocol LoginViewModelProtocol {
	var username: String { get }
	var password: String { get }
	var selection: String? { get }
	var showingWeakUsernamePasswordAlert: Bool { get }

	var welcomeBackText: String { get }
	var usernameText: String { get }
	var passwordText: String { get }
	var loginText: String { get }

	var alertTitleText: String { get }
	var alertMessageText: String { get }
	var alertDismissText: String { get }

	func mockNetworkRequest()
}

class LoginViewModel: ObservableObject, LoginViewModelProtocol {
	@Published var username: String = ""
	@Published var password: String = ""
	@Published var selection: String? = nil
	@Published var showingWeakUsernamePasswordAlert: Bool = false

	var welcomeBackText: String = "Welcome To Firefly!"
	var usernameText: String = "Username"
	var passwordText: String = "Password"
	var loginText: String = "Login"

	var alertTitleText: String = "Username or Password Error"
	var alertMessageText: String = "Usernames and Passwords must contain atleast one letter and number"
	var alertDismissText: String = "OK"

	func mockNetworkRequest() {
		let loginResponse: LoginResponse = MockNetworkLayer().validateLogin(username, password)

		if loginResponse.isSuccessful {
			UsernameSingleton.shared.username = loginResponse.username
			selection = ViewSelectionTitles.welcomeBackView.rawValue
		} else {
			showingWeakUsernamePasswordAlert = true
		}
	}
	
}
