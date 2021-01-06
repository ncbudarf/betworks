//
//  WelcomeBackView.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-05.
//

import SwiftUI

struct WelcomeBackView: View {
	var welcomeBackViewModel = WelcomeBackViewModel()

	var body: some View {
		NavigationView {
			VStack {
				GenericTextView(text: welcomeBackViewModel.welcomeBackText)

				GenericTextView(text: UsernameSingleton.shared.username)

				Spacer()
			}.padding()
			.padding([.leading, .trailing], ViewPaddingValues.fourtyPoints.rawValue)
		}.navigationBarTitle("")
		.navigationBarHidden(true)
	}
}

struct WelcomeBackView_Previews: PreviewProvider {
	static var previews: some View {
		WelcomeBackView()
	}
}
