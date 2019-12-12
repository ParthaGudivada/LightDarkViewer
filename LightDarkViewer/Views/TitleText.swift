//
//  TitleText.swift
//  LightDarkReader
//
//  Created by Parthasarathy Gudivada on 12/12/19.
//  Copyright © 2019 Partha. All rights reserved.
//

import SwiftUI

struct TitleText: View {
	var title = ""
	
	var body: some View {
		Text(title)
			.font(.largeTitle)
	}
	
	init(_ title: String) {
		self.title = title
	}
}

struct TitleText_Previews: PreviewProvider {
	static var previews: some View {
		TitleText("This is Title")
	}
}
