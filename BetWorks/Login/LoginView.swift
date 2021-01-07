//
//  ContentView.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-05.
//

import SwiftUI

enum ViewSelectionTitles: String {
	case welcomeBackView = "WelcomeBackView"
}

enum ViewPaddingValues: CGFloat {
	case aspectRatioFourPoints = 4.0
	case tenPoints = 10.0
	case twentyPoints = 20.0
	case fourtyPoints = 40.0
}

struct LoginView: View {

	@ObservedObject var loginViewModel: LoginViewModel = LoginViewModel()

    var body: some View {

		NavigationView {
			VStack {
				NavigationLink(destination: WelcomeBackView(), tag: ViewSelectionTitles.welcomeBackView.rawValue, selection: $loginViewModel.selection) {}

				GenericTextView(text: loginViewModel.welcomeBackText )
					.accessibility(identifier: "WELCOME_BACK_TEXT")

				ZStack(alignment: .leading) {
					Rectangle()
						.foregroundColor(.gray)
						.padding()

					if loginViewModel.username.isEmpty {
						Text(loginViewModel.usernameText)
							.foregroundColor(.black)
							.padding()
							.padding([.leading, .trailing], ViewPaddingValues.tenPoints.rawValue)
							.font(Font.system(size: ViewPaddingValues.twentyPoints.rawValue, design: .default))
					}
					TextField("", text: $loginViewModel.username)
						.padding()
						.padding([.leading, .trailing], ViewPaddingValues.tenPoints.rawValue)
						.font(Font.system(size: ViewPaddingValues.twentyPoints.rawValue, design: .default))
				}.aspectRatio(ViewPaddingValues.aspectRatioFourPoints.rawValue, contentMode: .fit)
				.accessibility(identifier: "USERNAME_FIELD")

				ZStack(alignment: .leading) {
					Rectangle()
						.foregroundColor(.gray)
						.padding()

					if loginViewModel.password.isEmpty {
						Text(loginViewModel.passwordText)
							.foregroundColor(.black)
							.padding()
							.padding([.leading, .trailing], ViewPaddingValues.tenPoints.rawValue)
							.font(Font.system(size: ViewPaddingValues.twentyPoints.rawValue, design: .default))
					}
					SecureField("", text: $loginViewModel.password)
						.padding()
						.padding([.leading, .trailing], ViewPaddingValues.tenPoints.rawValue)
						.font(Font.system(size: ViewPaddingValues.twentyPoints.rawValue, design: .default))
				}.aspectRatio(ViewPaddingValues.aspectRatioFourPoints.rawValue, contentMode: .fit)
				.accessibility(identifier: "PASSWORD_FIELD")

				Button(action: {

					guard !loginViewModel.username.isEmpty,
						  !loginViewModel.password.isEmpty
					else {
						self.loginViewModel.showingWeakUsernamePasswordAlert = true
						return
					}

					loginViewModel.mockNetworkRequest()
				}) {
					Text(loginViewModel.loginText)
						.padding()
						.padding([.leading, .trailing], ViewPaddingValues.tenPoints.rawValue)
						.frame(minWidth: 0, maxWidth: .infinity)
				}.foregroundColor(.white)
				.background(Color.accentColor)
				.padding()
				.accessibility(identifier: "LOGIN_BUTTON")
				.alert(isPresented: $loginViewModel.showingWeakUsernamePasswordAlert) {
					Alert(title: Text(loginViewModel.alertTitleText), message: Text(loginViewModel.alertMessageText), dismissButton: .default(Text(loginViewModel.alertDismissText)))
				}

				Spacer()

			}.padding()
			.padding([.leading, .trailing], ViewPaddingValues.fourtyPoints.rawValue)
		}.navigationBarTitle("")
		.navigationBarHidden(true)
		.accessibility(identifier: "LOGIN_VIEW")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
