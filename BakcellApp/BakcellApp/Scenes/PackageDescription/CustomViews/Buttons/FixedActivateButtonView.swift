//
//  FixedActivateButtonView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 29.02.24.
//

import UIKit
import SnapKit
import BakcellUIKit

class FixedActivateButtonView: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    lazy var activateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Aktivləşdir", for: .normal)
        button.backgroundColor = adaptiveColor(.main)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(activateButton)
    }
    
    private func setupConstraints() {
        activateButton.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 16, bottom: 36, right: 16))
            make.height.equalTo(56)
        }
    }
}
