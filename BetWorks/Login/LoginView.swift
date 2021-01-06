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

	@ObservedObject var loginVewModel: LoginVewModel = LoginVewModel()

    var body: some View {

		NavigationView {
			VStack {
				NavigationLink(destination: WelcomeBackView(), tag: ViewSelectionTitles.welcomeBackView.rawValue, selection: $loginVewModel.selection) {}

				GenericTextView(text: loginVewModel.welcomeBackText )

				ZStack(alignment: .leading) {
					Rectangle()
						.foregroundColor(.gray)
						.padding()

					if loginVewModel.username.isEmpty {
						Text(loginVewModel.usernameText)
							.foregroundColor(.black)
							.padding()
							.padding([.leading, .trailing], ViewPaddingValues.tenPoints.rawValue)
							.font(Font.system(size: ViewPaddingValues.twentyPoints.rawValue, design: .default))
					}
					TextField("", text: $loginVewModel.username)
						.padding()
						.padding([.leading, .trailing], ViewPaddingValues.tenPoints.rawValue)
						.font(Font.system(size: ViewPaddingValues.twentyPoints.rawValue, design: .default))
				}.aspectRatio(ViewPaddingValues.aspectRatioFourPoints.rawValue, contentMode: .fit)

				ZStack(alignment: .leading) {
					Rectangle()
						.foregroundColor(.gray)
						.padding()

					if loginVewModel.password.isEmpty {
						Text(loginVewModel.passwordText)
							.foregroundColor(.black)
							.padding()
							.padding([.leading, .trailing], ViewPaddingValues.tenPoints.rawValue)
							.font(Font.system(size: ViewPaddingValues.twentyPoints.rawValue, design: .default))
					}
					TextField("", text: $loginVewModel.password)
						.padding()
						.padding([.leading, .trailing], ViewPaddingValues.tenPoints.rawValue)
						.font(Font.system(size: ViewPaddingValues.twentyPoints.rawValue, design: .default))
				}.aspectRatio(ViewPaddingValues.aspectRatioFourPoints.rawValue, contentMode: .fit)

				Button(action: {

					guard !loginVewModel.username.isEmpty,
						  !loginVewModel.password.isEmpty
					else {
						self.loginVewModel.showingWeakUsernamePasswordAlert = true
						return
					}

					let loginResponse: LoginResponse = MockNetworkLayer().validateLogin(loginVewModel.username, loginVewModel.password)

					if loginResponse.isSuccessful {
						UsernameSingleton.shared.username = loginResponse.username
						self.loginVewModel.selection = ViewSelectionTitles.welcomeBackView.rawValue
					} else {
						self.loginVewModel.showingWeakUsernamePasswordAlert = true
					}
				}) {
					Text(loginVewModel.loginText)
						.padding()
						.padding([.leading, .trailing], ViewPaddingValues.tenPoints.rawValue)
						.frame(minWidth: 0, maxWidth: .infinity)
				}.foregroundColor(.white)
				.background(Color.accentColor)
				.padding()
				.alert(isPresented: $loginVewModel.showingWeakUsernamePasswordAlert) {
					Alert(title: Text(loginVewModel.alertTitleText), message: Text(loginVewModel.alertMessageText), dismissButton: .default(Text(loginVewModel.alertDismissText)))
						}

				Spacer()

			}.padding()
			.padding([.leading, .trailing], ViewPaddingValues.fourtyPoints.rawValue)
		}.navigationBarTitle("")
		.navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
