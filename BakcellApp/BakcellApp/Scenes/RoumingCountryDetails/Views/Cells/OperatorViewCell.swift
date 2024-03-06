//
//  OperatorViewCell.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//


import UIKit
import BakcellUIKit

class OperatorViewCell: UITableViewCell, ThemeableView {

    static var reuseIdentifier = "OperatorViewCell"
    var theme: ThemeProvider = App.theme
    
//    var data: OperatorModel? {
//        didSet {
//            configure()
//        }
//    }
    
    private lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = adaptiveColor(.whitePrimary)
        view.layer.cornerRadius = 24
        view.layer.borderColor = adaptiveColor(.grayPrimary).cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    private lazy var contentVStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    private lazy var operatorTitleLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.SFBoldTitle2.fontStyle
        label.textColor = adaptiveColor(.black)
        return label
    }()
    
    private lazy var operatorServiceVStackView: OperatorServiceVStackView = {
        let stackView = OperatorServiceVStackView()

        return stackView
    }()
    
    //MARK: Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        self.addSubviews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    private func addSubviews() {
        self.contentVStackView.addArrangedSubview(self.operatorTitleLabel)
        self.contentVStackView.addArrangedSubview(self.operatorServiceVStackView)
        
        self.backView.addSubview(self.contentVStackView)
        self.contentView.addSubview(self.backView)
       
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.backView.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        self.contentVStackView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
    
    
    private func configure() {
        self.operatorTitleLabel.text = "TT MobileB"
        self.operatorServiceVStackView.data = .init(services: [
            .init(packageType: .call, volumes: [
                .init(title: "Daxil olan", volume: "0.39 ₼", volumeType: "deq"),
                .init(title: "Çıxan", volume: "0.99 ₼", volumeType: "deq")
            ]),
            .init(packageType: .sms, volumes: [
                .init(title: "Daxil olan", volume: "Pulsuz", volumeType: ""),
                .init(title: "Çıxan", volume: "0.19 ₼", volumeType: "sms")
            ]),
            .init(packageType: .internet, volumes: [
                .init(title: "Sərfiyyat", volume: "-", volumeType: ""),
                .init(title: "Şəbəkə", volume: "2G, 3G, 4G", volumeType: "")
            ]),
        ])
        
    }
}
