//
//  CountrySearchView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 22.02.24.
//

import UIKit
import BakcellUIKit


class CountrySearchView: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    private lazy var searchView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = adaptiveColor(.grayPrimary).cgColor
        return view
    }()
    
    
    private lazy var searchLabel: UILabel = {
        let label = UILabel()
        label.text = "Axtarış..."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    
    private lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        return imageView
    }()
    
    
    //MARK: Init
       override init(frame: CGRect) {
           super.init(frame: frame)
         
           self.setupViews()
       }
    
       required init?(coder: NSCoder) {
           fatalError()
       }
       
    
    private func setupViews() {
        self.addSubview(searchView)
        searchView.addSubview(searchLabel)
        searchView.addSubview(searchImageView)
        
        self.updateConstraints()
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        searchView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }

        searchLabel.snp.updateConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }

        searchImageView.snp.updateConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.size.equalTo(20)
        }
    }
}
