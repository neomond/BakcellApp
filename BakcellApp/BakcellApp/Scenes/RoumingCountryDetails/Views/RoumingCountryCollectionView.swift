//
//  RoumingCountryCollectionView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 26.02.24.
//

import UIKit
import SnapKit

protocol RoumingCountryCollectionViewDelegate: AnyObject {
    func didSelectItem(at indexPath: IndexPath)
}

final class RoumingCountryCollectionView: UIView {
    
    weak var delegate: RoumingCountryCollectionViewDelegate?
    
    private let titles = ["Paketlər", "Operatorlar", "Qiymət müqayisəsi"]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(RoumingCountryCollectionViewCell.self, forCellWithReuseIdentifier: RoumingCountryCollectionViewCell.reuseIdentifier)
        return collectionView
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        self.addSubviews()
        self.addConstraints()
        self.selectFirstItem()
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        super.updateConstraints()
    }
    
    
    private func addSubviews() {
        
        self.addSubview(collectionView)
    }
    
    
    private func addConstraints() {
        
        collectionView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    

    func selectFirstItem() {
        let firstIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: firstIndexPath, animated: false, scrollPosition: .left)
        
        collectionView.delegate?.collectionView?(collectionView, didSelectItemAt: firstIndexPath)
    }

}


// MARK: - UICollectionViewDelegate

extension RoumingCountryCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedItems = collectionView.indexPathsForSelectedItems {
            for selectedItem in selectedItems where selectedItem != indexPath {
                collectionView.deselectItem(at: selectedItem, animated: false)
                collectionView.cellForItem(at: selectedItem)?.isSelected = false
            }
        }
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? RoumingCountryCollectionViewCell else { return }
        cell.isSelected = !cell.isSelected
        
        delegate?.didSelectItem(at: indexPath)
    }
}



// MARK: - UICollectionViewDataSource

extension RoumingCountryCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoumingCountryCollectionViewCell", for: indexPath) as? RoumingCountryCollectionViewCell else {
            fatalError("Unable to dequeue RoumingCountryCollectionViewCell")
        }
       
      
        cell.configure(with: titles[indexPath.row])
        
        return cell
    }
}


// MARK: - UICollectionViewDelegateFlowLayout

extension RoumingCountryCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let title = titles[indexPath.row]
        let horizontalPadding: CGFloat = 8
        let font = UIFont.systemFont(ofSize: 14, weight: .regular)
        let titleWidth = title.size(withAttributes: [NSAttributedString.Key.font: font]).width + horizontalPadding * 2
        let cellWidth = max(titleWidth, 100)
        return CGSize(width: cellWidth, height: collectionView.frame.height)
    }

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    
    }
}
