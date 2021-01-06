//
//  WelcomeBackView.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-05.
//

import SwiftUI

struct WelcomeBackView: View {

	var body: some View {
		NavigationView {
			VStack {
				GenericTextView(text: "Welcome Back")

				GenericTextView(text: UsernameSingleton.shared.username)

				Spacer()
			}.padding()
			.padding([.leading, .trailing], 40)
		}.navigationBarTitle("")
		.navigationBarHidden(true)
	}
}

struct WelcomeBackView_Previews: PreviewProvider {
	static var previews: some View {
		WelcomeBackView()
	}
}
