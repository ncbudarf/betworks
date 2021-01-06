//
//  ContentView.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-05.
//

import SwiftUI

class UsernameSingleton: ObservableObject {
	static let shared = UsernameSingleton()
	var username: String = ""
}

struct LoginView: View {

	@State var username: String = ""
	@State var password: String = ""
	@State private var selection: String? = nil

	@State private var showingWeakUsernamePasswordAlert = false

    var body: some View {

		NavigationView {
			VStack {
				NavigationLink(destination: WelcomeBackView(), tag: "WelcomeBackView", selection: $selection) {}

				GenericTextView(text: "Welcome To Firefly!")

				ZStack(alignment: .leading) {
					Rectangle()
						.foregroundColor(.gray)
						.padding()

					if username.isEmpty {
						Text("Username")
							.foregroundColor(.black)
							.padding()
							.padding([.leading, .trailing], 10)
							.font(Font.system(size: 20, design: .default))
					}
					TextField("", text: $username)
						.padding()
						.padding([.leading, .trailing], 10)
						.font(Font.system(size: 20, design: .default))
				}.aspectRatio(4.0, contentMode: .fit)

				ZStack(alignment: .leading) {
					Rectangle()
						.foregroundColor(.gray)
						.padding()

					if password.isEmpty {
						Text("Password")
							.foregroundColor(.black)
							.padding()
							.padding([.leading, .trailing], 10)
							.font(Font.system(size: 20, design: .default))
					}
					TextField("", text: $password)
						.padding()
						.padding([.leading, .trailing], 10)
						.font(Font.system(size: 20, design: .default))
				}.aspectRatio(4.0, contentMode: .fit)

				Button(action: {

					guard !username.isEmpty,
						  !password.isEmpty
					else {
						self.showingWeakUsernamePasswordAlert = true
						return
					}

					let loginResponse: LoginResponse = MockNetworkLayer().validateLogin(username, password)

					if loginResponse.isSuccessful {
						UsernameSingleton.shared.username = loginResponse.username
						self.selection = "WelcomeBackView"
					} else {
						self.showingWeakUsernamePasswordAlert = true
					}
				}) {
					Text("Login")
						.padding()
						.padding([.leading, .trailing], 10)
						.frame(minWidth: 0, maxWidth: .infinity)
				}.foregroundColor(.white)
				.background(Color.accentColor)
				.padding()
				.alert(isPresented: $showingWeakUsernamePasswordAlert) {
							Alert(title: Text("Username or Password Error"), message: Text("Usernames and Passwords must contain atleast one letter and number"), dismissButton: .default(Text("OK")))
						}

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
