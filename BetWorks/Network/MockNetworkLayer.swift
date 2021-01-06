//
//  MockNetworkLayer.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-06.
//

import Foundation

//{isSuccessful: Bool, username: String}

struct LoginResponse: Decodable {
	let isSuccessful: Bool
	let username: String
}

private final class MockNetworkLayer {
	func validateLogin(username: String, password: String) ->  LoginResponse {
		let jsonData = JSONResponse(username, password).data(using: .utf8)!
		let blogPost: LoginResponse = try! JSONDecoder().decode(LoginResponse.self, from: jsonData)
		return blogPost
	}

	private func JSONResponse(_ username: String, _ password: String) -> String {
		let isSuccessful = validate(input: username) && validate(input: username)

		let response = """
		{
			"isSuccessful": \(isSuccessful),
			"username": \(username),
		}
		"""

		return response
	}

	private func validate(input: String) -> Bool {
		guard input.count > 2,
			  input.rangeOfCharacter(from: NSCharacterSet.letters) != nil,
			  input.rangeOfCharacter(from: CharacterSet.decimalDigits) != nil
		else {
			return false
		}

		return true
	}
}