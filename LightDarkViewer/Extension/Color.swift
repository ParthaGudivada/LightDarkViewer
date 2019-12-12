//
//  Color.swift
//  LightDarkViewer
//
//  Created by Parthasarathy Gudivada on 12/12/19.
//  Copyright © 2019 Partha. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
	
	/**
	 Initializer to convert the hex string of the formats
	
	- parameter hexString : supported formats below
	-  "#FFFFFF" (which has R,G,B without alpha plus the prefix #)
	-  "#FFFFFFFF" (which has R,G,B with alpha plus the prefix #)
	-  "FFFFFF" (which has R,G,B without alpha and no prefix)
	-  "FFFFFFFF" (which has R,G,B without alpha plus and no prefix)
	*/
	
	init(hexString: String) throws  {
		
		var nonHashString = ""
		
		if hexString.starts(with: "#") {
			nonHashString = String(hexString[hexString.index(after: hexString.startIndex)...])
		} else {
			nonHashString = hexString
		}
		
		// if the input has 6 characters add alpha component of value FF
		if nonHashString.count == 6 {
			nonHashString.append("FF")
		}
		
		// if the character cound is other than 8, return nil
		guard nonHashString.count == 8 else {
			throw ColorError.invalidFormat(hexString)
		}
		
		let hexScanner = Scanner(string: nonHashString)
		
		var resultNumber: UInt64 = 0
		
		// ensure that the passed value is a hexadecimal number, otherwise return nil
		guard hexScanner.scanHexInt64(&resultNumber) else {
			throw ColorError.invalidHexFormat(resultNumber)
		}
		
		let r = Double((resultNumber & 0xFF000000) >> 24) / 255
		let g = Double((resultNumber & 0x00FF0000) >> 16) / 255
		let b = Double((resultNumber & 0x0000FF00) >> 8) / 255
		let alpha = Double(resultNumber & 0x000000FF) / 255
		
		self = Color(.sRGB, red: r, green: g, blue: b, opacity: alpha)
	}
}

enum ColorError: Error {
	case invalidFormat(String)
	
	case invalidHexFormat(UInt64)
}

extension ColorError: LocalizedError {
	
	var errorDescription: String? {
		
		switch self {
		case .invalidFormat(let notValid):
			return "Has invalid format: \(notValid). Should be a valid hex number of 6 or 8 digits"
		case .invalidHexFormat(let invalidHex):
			return "\(invalidHex) is not a valid Hex Number"
		}
	}
}
