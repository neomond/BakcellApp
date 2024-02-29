//
//  BorderedView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 27.02.24.
//

import UIKit

class BorderedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBorder()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBorder()
    }

    private func setupBorder() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = 5.0 
        self.clipsToBounds = true
    }
}
