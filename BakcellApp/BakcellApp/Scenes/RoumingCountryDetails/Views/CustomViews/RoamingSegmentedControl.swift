//
//  RoamingSegmentedControl.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit
import SnapKit
import BakcellUIKit

protocol RoamingSegmentedControlDelegate: AnyObject {
    func segmentedControl(_ segmentedControl: RoamingSegmentedControl, didSelectItemAt index: Int)
}

final class RoamingSegmentedControl: UIView, ThemeableView {
    var theme: ThemeProvider = App.theme
    
    weak var delegate: RoamingSegmentedControlDelegate?
    
    
    private lazy var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: self.titles)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        return sc
    }()
    
    private let titles: [String]
    
    init(titles: [String]) {
        self.titles = titles
        super.init(frame: .zero)
        self.setupUI()
        self.applySegmentedControlStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(segmentedControl)
        segmentedControl.snp.updateConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    private func applySegmentedControlStyle() {
        
        let normalTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: adaptiveColor(.black),
            .font: UIFont.systemFont(ofSize: 14, weight: .medium)
        ]
        let selectedTextAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: adaptiveColor(.black),
            .font: UIFont.systemFont(ofSize: 14, weight: .medium)
        ]
        
        segmentedControl.setTitleTextAttributes(normalTextAttributes, for: .normal)
        segmentedControl.setTitleTextAttributes(selectedTextAttributes, for: .selected)
        
        let normalBackgroundImage = UIImage(color: adaptiveColor(.grayPrimary), size: CGSize(width: 1, height: 1))
        let selectedBackgroundImage = UIImage(color: adaptiveColor(.whitePrimary), size: CGSize(width: 1, height: 1))
        
        segmentedControl.setBackgroundImage(normalBackgroundImage, for: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(selectedBackgroundImage, for: .selected, barMetrics: .default)
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
  

    }
    
    
    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        delegate?.segmentedControl(self, didSelectItemAt: sender.selectedSegmentIndex)
    }
}



// Helper extension to create an image from a color
extension UIImage {
    convenience init?(color: UIColor, size: CGSize) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}



//    func setSegmentedControl() {
//        let titleStrings = RoumingCountryDetail.categories
//        let titles: [NSAttributedString] = {
//            let attributes: [NSAttributedString.Key: Any] = [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.black)]
//            var titles = [NSAttributedString]()
//            for titleString in titleStrings {
//                let title = NSAttributedString(string: titleString, attributes: attributes)
//                titles.append(title)
//            }
//            return titles
//        }()
//
//        let selectedTitles: [NSAttributedString] = {
//            let attributes: [NSAttributedString.Key: Any] =  [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.whitePrimary)]
//            var selectedTitles = [NSAttributedString]()
//            for titleString in titleStrings {
//                let selectedTitle = NSAttributedString(string: titleString, attributes: attributes)
//                selectedTitles.append(selectedTitle)
//            }
//            return selectedTitles
//        }()
//
//        self.mainView?.filterSegmentedControl.setTitles(titles, selectedTitles: selectedTitles)
//    }
