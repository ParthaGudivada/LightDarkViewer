//
//  SubTitleText.swift
//  LightDarkReader
//
//  Created by Parthasarathy Gudivada on 12/12/19.
//  Copyright © 2019 Partha. All rights reserved.
//

import SwiftUI

struct SubTitleText {
	
	private var subTitle = ""
	
	init(_ subTitle: String) {
		self.subTitle = subTitle
	}
}

extension SubTitleText: View {
	
	var body: some View {
		Text(subTitle)
			.font(.title)
		//.foregroundColor(.gray)
	}
}

struct SubTitleText_Previews: PreviewProvider {
	static var previews: some View {
		SubTitleText("This is subtitle")
	}
}
