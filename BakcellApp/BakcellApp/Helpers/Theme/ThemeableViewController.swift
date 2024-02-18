//
//  ThemeableViewController.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit
import BakcellUIKit

protocol ThemeableViewController {
    var theme: ThemeProvider { get }
}

extension ThemeableViewController where Self: UIViewController {
    
    func adaptiveColor(_ style: ColorStyle) -> UIColor {
        if #available(iOS 13.0, *) {
            return theme.adaptiveColor(style, isDarkMode: self.traitCollection.userInterfaceStyle == .dark, isHighContrast: self.traitCollection.accessibilityContrast == .high)
        } else {
            return theme.adaptiveColor(style, isDarkMode: self.traitCollection.userInterfaceStyle == .dark, isHighContrast: false)
        }
    }
}
