//
//  LoginResponse.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-06.
//

import Foundation

struct LoginResponse: Decodable {
	let isSuccessful: Bool
	let username: String
}
