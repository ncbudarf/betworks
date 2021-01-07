//
//  LoginViewModel.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-06.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
	private let networkLayer: MockNetworkLayer
	private let usernameSingleton: UsernameSingleton

	init(dependencies: Dependencies = Dependencies.shared) {
		networkLayer = dependencies.networkLayer
		usernameSingleton = dependencies.usernameSingleton
	}

	@Published var username: String = ""
	@Published var password: String = ""
	@Published var selection: String? = nil
	@Published var showingWeakUsernamePasswordAlert: Bool = false

	let welcomeBackText: String = "Welcome To Firefly!"
	let usernameText: String = "Username"
	let passwordText: String = "Password"
	let loginText: String = "Login"

	let alertTitleText: String = "Username or Password Error"
	let alertMessageText: String = "Usernames and Passwords must contain atleast one letter and number"
	let alertDismissText: String = "OK"

	func mockNetworkRequest() {
		guard validate(input: username),
			  validate(input: password)
		else {
			showingWeakUsernamePasswordAlert = true
			return
		}

		networkLayer.postLogin(username, password, completion: { result in
			switch result {
				case .success(let loginResponse):
					self.usernameSingleton.username = loginResponse.username
					self.selection = ViewSelectionTitles.welcomeBackView.rawValue
				case .failure(let error):
					print(error.localizedDescription)
					self.showingWeakUsernamePasswordAlert = true
				}
		})
	}

	func validate(input: String) -> Bool {
		guard input.count >= 2,
			  input.rangeOfCharacter(from: NSCharacterSet.letters) != nil,
			  input.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
		else {
			return false
		}

		return true
	}
	
}
