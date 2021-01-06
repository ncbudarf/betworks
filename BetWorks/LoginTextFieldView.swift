//
//  LoginTextFieldView.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-05.
//

import SwiftUI

struct LoginTextFieldView: View {

	@State var textFieldValue: String

	var body: some View {
		ZStack(alignment: .leading) {
			Rectangle()
				.foregroundColor(.gray)
				.padding()

			if textFieldValue.isEmpty {
				Text("Username")
					.foregroundColor(.black)
					.padding()
					.padding([.leading, .trailing], 10)
					.font(Font.system(size: 20, design: .default))
			}
			TextField("", text: $textFieldValue)
				.font(Font.system(size: 20, design: .default))
		}.aspectRatio(4.0, contentMode: .fit)
	}
}
