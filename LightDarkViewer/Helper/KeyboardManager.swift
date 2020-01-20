//
//  KeyboardManager.swift
//  LightDarkViewer
//
//  Created by Parthasarathy Gudivada on 12/14/19.
//  Copyright © 2019 Partha. All rights reserved.
//

import UIKit
import SwiftUI

final class KeyboardManager : ObservableObject {
	
	@Published var keyboardHeight: CGFloat = 0
	@Published var isVisible = false
	
	init() {
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardVisibilityChanged(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
	}
	
	@objc private func keyboardVisibilityChanged(_ notification: Notification) {
	
		guard let userInfo = notification.userInfo else { return }
		guard let keyboardEndFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
		guard let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else { return }
		
		isVisible = keyboardEndFrame.minY < UIScreen.main.bounds.height
		
		withAnimation(Animation.easeIn(duration: duration) ) {
			keyboardHeight = isVisible ? keyboardEndFrame.height : 0
		}
	}
}

