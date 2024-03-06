//
//  OperatorServiceInfoStackView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit
import BakcellUIKit

class OperatorServiceInfoStackView: UIStackView {

    var data: RoumingOperatorServiceType? {
        didSet {
            configure()
        }
    }
    
    private lazy var infoTitleHStackView: OperatorInfoTitleVStackView = {
        let stackView = OperatorInfoTitleVStackView()
        return stackView
    }()
    
    private lazy var statusVStackView: OperatorStatusVStackView = {
        let stackView = OperatorStatusVStackView()
        return stackView
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.spacing = 24
        
        self.addSubviews()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    
    private func addSubviews() {
        self.addArrangedSubview(self.infoTitleHStackView)
        
        self.addArrangedSubview(self.statusVStackView)
        
        self.updateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.infoTitleHStackView.snp.updateConstraints { make in
            make.height.equalTo(24)
        }
    }
    
    
    private func configure() {
        guard let data = data else { return }
        infoTitleHStackView.configure(title: data.packageType.title, image: data.packageType.image!)
        
        statusVStackView.data = data.volumes
    }
}
