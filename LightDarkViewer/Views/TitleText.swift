//
//  TitleText.swift
//  LightDarkReader
//
//  Created by Parthasarathy Gudivada on 12/12/19.
//  Copyright © 2019 Partha. All rights reserved.
//

import SwiftUI

struct TitleText  {
	var title = ""
	
	init(_ title: String) {
		self.title = title
	}
}

extension TitleText: View {
	
	var body: some View {
		Text(title)
			.font(.largeTitle)
	}
}

struct TitleText_Previews: PreviewProvider {
	static var previews: some View {
		TitleText("This is Title")
	}
}
