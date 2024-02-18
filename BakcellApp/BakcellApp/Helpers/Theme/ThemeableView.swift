//
//  ThemeableView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit
import BakcellUIKit

protocol ThemeableView {
    var theme: ThemeProvider { get }
}

extension ThemeableView where Self: UIView {
    
    func adaptiveColor(_ style: ColorStyle) -> UIColor {
        if #available(iOS 13.0, *) {
            return theme.adaptiveColor(style, isDarkMode: self.traitCollection.userInterfaceStyle == .dark, isHighContrast: self.traitCollection.accessibilityContrast == .high)
        } else {
            return theme.adaptiveColor(style, isDarkMode: self.traitCollection.userInterfaceStyle == .dark, isHighContrast: false)
        }
    }
}
