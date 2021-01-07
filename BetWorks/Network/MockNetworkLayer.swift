//
//  MockNetworkLayer.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-06.
//

import Foundation
import Combine

protocol NetworkManager {
	func postLogin(_ username: String, _ password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void)
}

final class MockNetworkLayer: NetworkManager {
	func postLogin(_ username: String, _ password: String, completion: @escaping (Result<LoginResponse, Error>) -> Void) {
		DispatchQueue.main.async {
			let loginResponse = LoginResponse(isSuccessful: true, username: username)
			let result: Result<LoginResponse, Error> = .success(loginResponse)
			completion(result)
		}
	}
}
