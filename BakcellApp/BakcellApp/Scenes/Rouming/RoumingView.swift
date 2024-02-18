//
//  RoumingView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit
import BakcellUIKit

protocol RoumingViewDelegate: AnyObject {
    
}

final class RoumingView: UIView, ThemeableView {
    
    weak var delegate: RoumingViewDelegate?
    
    var theme: ThemeProvider = App.theme
    
    init() {
        super.init(frame: .zero)
        
        
        self.addSubviews()
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        super.updateConstraints()
    }
    
    
    // MARK: - Private
    
    private func addSubviews() {
        
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.grayPrimary)
    }
}
