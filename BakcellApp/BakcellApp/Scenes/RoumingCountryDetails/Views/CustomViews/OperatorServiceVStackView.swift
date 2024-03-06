//
//  OperatorServiceVStackView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit

class OperatorServiceVStackView: UIStackView {
    
    var data: RoumingOperatorServices? {
        didSet {
            configure()
        }
    }
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.spacing = 24
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }


    private func configure() {
        guard let data = data else { return }
        for (index, serviceType) in data.services.enumerated() {
            // Create and add a view
            let view = OperatorServiceInfoStackView()
            view.data = serviceType
            self.addArrangedSubview(view)
            
            if index < data.services.count - 1 {
                let divider = AppDivider()
                self.addArrangedSubview(divider)
            }
        }
    }
}
