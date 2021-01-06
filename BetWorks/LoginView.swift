//
//  ContentView.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-05.
//

import SwiftUI
import UIKit

struct LoginView: View {

	@State var username: String = ""
	@State var password: String = ""

    var body: some View {
		NavigationView {
			VStack {
				Text("Welcome To Firefly!")
					.fontWeight(.semibold)
					.padding(.bottom, 20)

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

				}) {
					Text("Login")
						.padding()
						.padding([.leading, .trailing], 10)
						.frame(minWidth: 0, maxWidth: .infinity)
				}.foregroundColor(.white)
				.background(Color.accentColor)
				.padding()

			}.navigationBarTitle("")
			.navigationBarHidden(true)
			.padding()
			.padding([.leading, .trailing], 40)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
