//
//  TabBarView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

protocol TabBarViewDelegate: AnyObject {
    
}

final class TabBarView: UIView {
    
    weak var delegate: TabBarViewDelegate?
    
    
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
        //self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = .white
    }
}
