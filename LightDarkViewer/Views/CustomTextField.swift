//
//  CustomTextField.swift
//  LightDarkViewer
//
//  Created by Parthasarathy Gudivada on 12/12/19.
//  Copyright © 2019 Partha. All rights reserved.
//

import SwiftUI

struct CustomTextField {
	private var placeHolder: String 
	private var placeHolderTextColor: Color
	
	@Binding var textData: String
	
	init(placeHolder: String = "", textData: Binding<String>, placeHolderTextColor: Color = Color(.systemGray4)) {
		self.placeHolder = placeHolder
		self._textData = textData
		self.placeHolderTextColor = placeHolderTextColor
	}
}

extension CustomTextField: View {
	
	var body: some View {
		
		ZStack(alignment: .leading) {
			if textData.isEmpty {
				Text(placeHolder)
					.italic()
					.foregroundColor(placeHolderTextColor)
					.opacity(0.5)
			}
			
			TextField("", text: $textData)
		}
		.padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 10))
		.overlay(RoundedRectangle(cornerRadius: 8)
		.stroke(Color.green, lineWidth: 2)
		)
	}
}

struct CustomTextField_Previews: PreviewProvider {
	
	static var previews: some View {
		
		CustomTextField(placeHolder: "placeHolder text", textData: .constant("Sample text Data"))
	}
}
