//
//  InternetPackagesCell.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 19.02.24.
//

import UIKit
import SnapKit

protocol InternetPackagesCellDelegate: AnyObject {
    func onPackageSelected()
}


class InternetPackagesCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    weak var delegate: InternetPackagesCellDelegate?
    
    var internetPackages: [InternetPackagesItemModel]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    
    var smsPackages: [SMSCallPackagesItemModel]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
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
        collectionView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(height)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch self.cellType {
        case .internet:
            self.internetPackages?.count ?? 0
        case .smsAndCall:
            self.smsPackages?.count ?? 0
        }
    }
    
    var cellType: PackageCellType = .internet
    var height: CGFloat{
        return cellType == .internet ? 190 : 150
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCollectionViewCell", for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        switch self.cellType {
        case .internet:
            guard let model = self.internetPackages?[indexPath.row]  else {
                return UICollectionViewCell()
            }
            cell.configureCell(type: cellType, dataAmount: model.title, priceTimePeriod: model.period, labelText: model.type)
            
        case .smsAndCall:
            
            guard let model = self.smsPackages?[indexPath.row]  else {
                return UICollectionViewCell()
            }
            cell.configureCell(type: cellType, dataAmount: model.title, priceTimePeriod: model.period, labelText: model.type)
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 167, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.onPackageSelected()
    }
}

