//
//  LoginButton.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-05.
//

import SwiftUI

struct LoginButton: View {

	var buttonText: String

	var body: some View {
		Button(action: {

		}) {
			Text(buttonText)
				.padding()
				.padding([.leading, .trailing], 10)
				.frame(minWidth: 0, maxWidth: .infinity)
		}.foregroundColor(.white)
		.background(Color.accentColor)
		.padding()
	}
}
