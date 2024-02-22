//
//  TravelTableViewCell.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 21.02.24.
//

import UIKit
import BakcellUIKit

class TravelTableViewCell: UITableViewCell, ThemeableView {
    static var reuseIdentifier = "TravelTableViewCell"
    
    var theme: ThemeProvider = App.theme
    
    //Mock data, change later
    let countries = ["Turkiye", "Rusiya", "Almaniya", "Qazaxistan", "Cexiya", "Ispania", "Italiya"]
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    
    private lazy var mapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "map")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    private lazy var mapLabel: UILabel = {
        let mapLabel = UILabel()
        mapLabel.font = UIFont.systemFont(ofSize: 17)
        mapLabel.textAlignment = .center
        mapLabel.text = "Hara səyahət etmək istəyirsiniz?"
        return mapLabel
    }()
    
    
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
    
//    private lazy var searchTextFieldView: SearchTextFieldView = {
//        let view = SearchTextFieldView()
//        return view
//    }()
    
    private lazy var searchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .gray
        return imageView
    }()
    
    
    private lazy var destinationsCollectionView: UICollectionView = {
        let layout = CollectionViewCenteredFlowLayout()
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
       
        collectionView.register(DestinationCollectionViewCell.self, forCellWithReuseIdentifier: DestinationCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(mapImageView)
        containerView.addSubview(mapLabel)
//        containerView.addSubview(searchView)
//        searchView.addSubview(searchLabel)
//        searchView.addSubview(searchImageView)
        containerView.addSubview(destinationsCollectionView)
        
        self.updateConstraints()
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        containerView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mapImageView.snp.updateConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        mapLabel.snp.updateConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalToSuperview().offset(48)
          
        }
        
//        searchView.snp.makeConstraints { make in
//            make.leading.trailing.equalToSuperview().inset(16)
//            make.top.equalTo(mapLabel.snp.bottom).offset(18)
//
//            make.height.equalTo(44)
//        }
//        
//        searchLabel.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.leading.equalToSuperview().offset(16)
//        }
//        
//        searchImageView.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.trailing.equalToSuperview().inset(16)
//            make.size.equalTo(20)
//        }
        
        destinationsCollectionView.snp.updateConstraints { make in
            make.top.equalTo(mapLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
}


extension TravelTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestinationCollectionViewCell.reuseIdentifier, for: indexPath) as? DestinationCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: self.countries[indexPath.row])
        print(self.countries[indexPath.row])
        return cell
    }
}

class SearchTextFieldView: UIView {
    
}
