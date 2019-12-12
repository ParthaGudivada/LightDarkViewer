//
//  SubTitleText.swift
//  LightDarkReader
//
//  Created by Parthasarathy Gudivada on 12/12/19.
//  Copyright © 2019 Partha. All rights reserved.
//

import SwiftUI

struct SubTitleText: View {
	
	var subTitle = ""
	
	var body: some View {
		Text(subTitle)
			.font(.title)
			//.foregroundColor(.gray)
	}
	
	init(_ subTitle: String) {
		self.subTitle = subTitle
	}
}

struct SubTitleText_Previews: PreviewProvider {
	static var previews: some View {
		SubTitleText("This is subtitle")
	}
}
