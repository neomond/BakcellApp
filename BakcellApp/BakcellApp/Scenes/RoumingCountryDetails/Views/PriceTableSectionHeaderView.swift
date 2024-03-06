//
//  PriceTableSectionHeaderView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit
import BakcellUIKit

class PriceTableSectionHeaderView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    let title: String
    
    
    var isOperationHeaderView: Bool? {
        didSet {
            self.configureFont()
        }
    }
    
    var isChildView: Bool? {
        didSet {
            self.configureChildView()
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font  = AppFonts.SFBoldCaption3.fontStyle
        lbl.textColor = adaptiveColor(.black)
        lbl.numberOfLines = 0
        lbl.text = title
        return lbl
    }()
    
    //MARK: Init
    
    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        self.clipsToBounds = true
        self.layer.borderColor = adaptiveColor(.grayPrimary).cgColor
        self.layer.borderWidth = 1
        self.addSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func addSubviews() {
        self.addSubview(self.titleLabel)
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()

        self.snp.updateConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(120)
           
        }
        
        self.titleLabel.snp.updateConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
    }
    
    private func configureFont() {
        self.titleLabel.textAlignment = .center
        
    }
    private func configureChildView() {
        self.titleLabel.font = AppFonts.SFRegularSubheadline.fontStyle
        
    }
}
