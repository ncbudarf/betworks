//
//  WelcomeBackViewModel.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-06.
//

import Foundation

protocol WelcomeBackViewModelProtocol {
	var welcomeBackText: String { get }
}

class WelcomeBackViewModel: WelcomeBackViewModelProtocol {
	var welcomeBackText = "Welcome Back"
}
