//
//  OperatorStatusHStackView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//


import UIKit
import BakcellUIKit

struct OperatorStatusInfoModel {
    let title: String
    let subtitle: String
}

class OperatorStatusHStackView: UIStackView, ThemeableView {
    
    
    var theme: ThemeProvider = App.theme
    
    var data: OperatorStatusInfoModel? {
        didSet {
            configure()
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldSubheadline.fontStyle
        lbl.textColor = adaptiveColor(.black)
        return lbl
    }()
    
    lazy var subtitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = AppFonts.SFBoldTitle3.fontStyle
        lbl.textColor = adaptiveColor(.black)
        return lbl
    }()
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .horizontal
        self.distribution = .equalSpacing
        self.spacing = 0
        
        self.addSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addArrangedSubview(self.titleLabel)
        self.addArrangedSubview(self.subtitleLabel)
        
        self.updateConstraints()
    }
    
    private func configure() {
        guard let data = data else {
            return
        }
        
        self.titleLabel.text = data.title
        self.subtitleLabel.text = data.subtitle
    }
}
