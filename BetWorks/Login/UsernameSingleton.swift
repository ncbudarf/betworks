//
//  UsernameSingleton.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-06.
//

import Foundation
import SwiftUI

class UsernameSingleton: ObservableObject {
	static let shared = UsernameSingleton()
	var username: String = ""
}
