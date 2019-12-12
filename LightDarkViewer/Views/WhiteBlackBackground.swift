//
//  WhiteBlackBackground.swift
//  LightDarkReader
//
//  Created by Parthasarathy Gudivada on 12/12/19.
//  Copyright © 2019 Partha. All rights reserved.
//

import SwiftUI

struct WhiteBlackBackground: View {
	
	var body: some View {
		
		GeometryReader { (gr)  in
			HStack(spacing: 0) {
				Rectangle()
					.frame(width: gr.size.width * 0.5)
					.foregroundColor(.white)
				
				Rectangle()
					.frame(width: gr.size.width * 0.5)
					.foregroundColor(.black)
			}
		}
	}
}

struct WhiteBlackBackground_Previews: PreviewProvider {
	static var previews: some View {
		WhiteBlackBackground()
	}
}
