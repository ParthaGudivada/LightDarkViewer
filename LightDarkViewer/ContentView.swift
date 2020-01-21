//
//  ContentView.swift
//  LightDarkViewer
//
//  Created by Parthasarathy Gudivada on 12/12/19.
//  Copyright © 2019 Partha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State private var sampleData = ""
	@State private var textColor = ""
	@State private var backColor = ""
	
	@ObservedObject var keyboardResponder: KeyboardManager
	
	var body: some View {
		
		ZStack(alignment: .top, content: {
			Color.secondary
		
			VStack(spacing: 20) {
				
				TitleText("Viewer").padding()
				SubTitleText("Light / Dark mode").foregroundColor(Color(.darkGray))
				CustomTextField(placeHolder: .sampleString, textData: $sampleData)
				
				CustomTextField(placeHolder: .textColor, textData: $textColor)
				
				Text("Side by Side (Light/Dark)")
				
				HStack(spacing: 0) {
					Rectangle()
						.fill(Color.white)
					Rectangle()
						.fill(Color.black)
				}
				.overlay( Text(sampleData.isEmpty ? .sampleString : sampleData)
									.foregroundColor(self.validColor(self.textColor))
									.font(.title)
								)
				.frame(height: 50)
				
				VStack(spacing: 5) {
					Text("Light Mode")

					HStack {
						Text(sampleData.isEmpty ? .sampleString : sampleData)
							.foregroundColor(self.validColor(self.textColor))
							.frame(maxWidth: .infinity)
							.font(.title)
							.padding()
					}
					.frame(height: 50)
					.background(RoundedRectangle(cornerRadius: 8)
												.foregroundColor(.white))
				}
				
				VStack(spacing: 5) {
					Text("Dark Mode")

					HStack {
						Text(sampleData.isEmpty ? .sampleString : sampleData)
							.foregroundColor(self.validColor(self.textColor))
							.frame(maxWidth: .infinity)
							.font(.title)
						}
					.frame(height: 50)
					.background(RoundedRectangle(cornerRadius: 8)
					.foregroundColor(.black))
				}
				
				Spacer()
			}
			.padding(EdgeInsets(top: 10, leading: 15, bottom: keyboardResponder.keyboardHeight, trailing: 10))
			
		})
		.edgesIgnoringSafeArea(.all)
	}
	
}

extension ContentView {
	
	func validColor(_ hexString: String) -> Color {
		
		do {
			return try Color(hexString: hexString)
		} catch {
			return .red
		}
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(keyboardResponder: KeyboardManager())
	}
}

extension String {
	static let sampleString = "Sample text to be displayed"
	static let textColor = "text - #FF0000"
	static let backColor = "back - #00000000"
}

extension CGFloat {
	static let rowHeight = 50.0
}
