//
//  GenericTextView.swift
//  BetWorks
//
//  Created by Noah budarf on 2021-01-05.
//

import SwiftUI

struct GenericTextView: View {

	var text: String

	var body: some View {
		Text(text)
			.fontWeight(.semibold)
			.padding(.bottom, ViewPaddingValues.twentyPoints.rawValue)
	}
}
