//
//  BackgroundText.swift
//  LightDarkReader
//
//  Created by Parthasarathy Gudivada on 12/12/19.
//  Copyright © 2019 Partha. All rights reserved.
//

import SwiftUI

struct BackgroundText {
	private var text: String
	private var backColor: Color
	private var textColor: Color
	
	init(_ text: String, backColor: Color = .blue, textColor: Color = .primary) {
		self.text = text
		self.backColor = backColor
		self.textColor = textColor
	}
}

extension BackgroundText: View {
	
	var body: some View {
		Text(text)
			.font(.title)
			.frame(maxWidth: .infinity)
			.padding()
			.background(backColor)
			.foregroundColor(textColor)
	}
	
}


struct BackgroundText_Previews: PreviewProvider {
	static var previews: some View {
		BackgroundText("Text that has background with blue as background and text with primary")
	}
}
