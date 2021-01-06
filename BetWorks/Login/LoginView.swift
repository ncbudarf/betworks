//
//  ContentView.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-05.
//

import SwiftUI

struct LoginView: View {

	@State var username: String = ""
	@State var password: String = ""
	@State private var selection: String? = nil

    var body: some View {

		NavigationView {
			VStack {
				NavigationLink(destination: WelcomeBackView(username: username), tag: "WelcomeBackView", selection: $selection) { EmptyView() }

				GenericTextView(text: "Welcome To Firefly!")

				LoginTextFieldView(textFieldValue: username, textFieldPlaceholderText: "Username")

				LoginTextFieldView(textFieldValue: password, textFieldPlaceholderText: "Password")

				Button(action: {
					self.selection = "WelcomeBackView"
				}) {
					Text("Login")
						.padding()
						.padding([.leading, .trailing], 10)
						.frame(minWidth: 0, maxWidth: .infinity)
				}.foregroundColor(.white)
				.background(Color.accentColor)
				.padding()

				Spacer()

			}.padding()
			.padding([.leading, .trailing], 40)
		}.navigationBarTitle("")
		.navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
