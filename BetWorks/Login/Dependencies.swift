//
//  Dependencies.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-07.
//

import Foundation

class Dependencies {
	static var shared = Dependencies()
	var usernameSingleton = UsernameSingleton.shared
	var networkLayer: MockNetworkLayer = MockNetworkLayer()
}
