//
//  AboutView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 29.02.24.
//

import UIKit
import SnapKit
import BakcellUIKit


class AboutView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    var detailTexts: [String] = [] {
           didSet {
               setupDetails()
           }
       }
       
       private lazy var aboutTitleLabel: UILabel = {
           let label = UILabel()
           label.text = "Ətraflı məlumat"
           label.font = UIFont.boldSystemFont(ofSize: 17)
           return label
       }()
       
       private lazy var stackView: UIStackView = {
           let sv = UIStackView()
           sv.axis = .vertical
           sv.spacing = 4
           return sv
       }()
       
       init() {
           super.init(frame: .zero)
           setupView()
       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       private func setupView() {
           addSubview(stackView)
           stackView.addArrangedSubview(aboutTitleLabel)
           stackView.snp.makeConstraints { make in
               make.edges.equalToSuperview()
           }
       }
       
       private func setupDetails() {
           for text in detailTexts {
               let detailLabel = UILabel()
               detailLabel.setBulletText([text], font: UIFont.systemFont(ofSize: 15), bulletColor: adaptiveColor(.black), textColor: adaptiveColor(.black))
               stackView.addArrangedSubview(detailLabel)
           }
       }
   }
