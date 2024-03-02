//
//  BorderedView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 27.02.24.
//

import UIKit
import BakcellUIKit

class BorderedView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBorder()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

    private func setupBorder() {
        self.backgroundColor = adaptiveColor(.grayPrimary)
    }
}
