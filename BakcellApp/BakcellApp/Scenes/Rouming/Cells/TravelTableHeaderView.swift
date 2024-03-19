//
//  TravelTableViewCell.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 21.02.24.
//

import UIKit
import BakcellUIKit

protocol TravelTableHeaderViewDelegate: AnyObject {
    func onCountrySelected(selectedCountryName: String)
}

class TravelTableHeaderView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    
    //Mock data, change later
  
    weak var delegate: TravelTableHeaderViewDelegate?
    
    var items: [String: String] = [:] {
        didSet {
            self.destinationsCollectionView.reloadData()
            self.destinationsCollectionView.invalidateIntrinsicContentSize()
        }
    }
    
    
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
        imageView.image = UIImage(named: "map")
        return imageView
    }()
    
    
    private lazy var mapLabel: UILabel = {
        let mapLabel = UILabel()
        mapLabel.font = UIFont.systemFont(ofSize: 17)
        mapLabel.textAlignment = .center
        mapLabel.text = "Hara səyahət etmək istəyirsiniz?"
        return mapLabel
    }()
    
    
    private lazy var countrySearchView: CountrySearchView = {
        let view = CountrySearchView()
        return view
    }()
    
    
    private lazy var destinationsCollectionView: UICollectionView = {
        let layout = CollectionViewCenteredFlowLayout()
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 16, bottom: 16, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        collectionView.isScrollEnabled = false
        collectionView.register(DestinationCollectionViewCell.self, forCellWithReuseIdentifier: DestinationCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        containerView.addSubview(mapImageView)
        containerView.addSubview(mapLabel)
        containerView.addSubview(countrySearchView)
        containerView.addSubview(destinationsCollectionView)
        self.addSubview(containerView)
        
        
        self.updateConstraints()
    }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        containerView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mapImageView.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalToSuperview().dividedBy(2)
        }
        
        mapLabel.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(48)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        countrySearchView.snp.updateConstraints { make in
            make.top.equalTo(mapLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(44)
        }
        
        destinationsCollectionView.snp.updateConstraints { make in
            make.top.equalTo(countrySearchView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(150)
        }
    }
}


extension TravelTableHeaderView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DestinationCollectionViewCell.reuseIdentifier, for: indexPath) as? DestinationCollectionViewCell else {
            return UICollectionViewCell()
        }
        print(self.items)
        
        cell.data = self.items.values.map { $0 }[indexPath.row]
//        print(self.items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.onCountrySelected(selectedCountryName: self.items.values.map { $0 }[indexPath.row])
        
    }
}
