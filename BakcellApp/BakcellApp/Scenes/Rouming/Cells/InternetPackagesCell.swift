//
//  InternetPackagesCell.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 19.02.24.
//

import UIKit
import SnapKit

class InternetPackagesCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    var cellType: PackageCellType = .internet
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let dataAmount = cellType   == .internet ? "1000" : "100"
        let priceText = cellType    == .internet  ? "3.00 ₼" : "50.00 ₼"
        let priceTimePeriod = cellType == .internet ? " / Gün" : " / Ay"
        let labelText = cellType == .internet ? "Internet" : "Zəng"
        cell.configureCell(type: cellType, dataAmount: dataAmount, priceText: priceText, priceTimePeriod: priceTimePeriod, labelText: labelText)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height: CGFloat = cellType == .internet ? 190 : 150
        return CGSize(width: 167, height: height)
    }

}

