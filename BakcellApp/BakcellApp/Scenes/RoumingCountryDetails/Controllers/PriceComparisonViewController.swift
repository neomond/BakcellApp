//
//  PriceComparisonViewController.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit
import BakcellUIKit

class PriceComparisonViewController: UIViewController, ThemeableViewController {

    var theme: ThemeProvider = App.theme
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private lazy var contentBackView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var priceComparisonView: PriceComparisonViewCell = {
        let view = PriceComparisonViewCell()
        return view
    }()
    
    private lazy var roamingSegmentedControl: SegmentedControl = {
        let segmentedControl = SegmentedControl()
        segmentedControl.backgroundColor = adaptiveColor(.grayPrimary)
        segmentedControl.selectionBoxStyle = .default
        segmentedControl.selectionBoxColor = adaptiveColor(.whitePrimary)
        segmentedControl.selectionBoxCornerRadius = 10
        segmentedControl.layoutPolicy = .fixed
        segmentedControl.segmentSpacing = 0
        segmentedControl.selectionBoxHeight = 32
        segmentedControl.selectionHorizontalPadding = 8
        segmentedControl.contentInset = .zero
        segmentedControl.clipsToBounds = true
        segmentedControl.delegate = self
        return segmentedControl
    }()
    
    func setSegmentedControl() {
        let titleStrings = ["Öncədən ödənişli", "Fakturalı"]
        let titles: [NSAttributedString] = {
            let attributes: [NSAttributedString.Key: Any] = [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.black)]
            var titles = [NSAttributedString]()
            for titleString in titleStrings {
                let title = NSAttributedString(string: titleString, attributes: attributes)
                titles.append(title)
            }
            return titles
        }()
        
        let selectedTitles: [NSAttributedString] = {
            let attributes: [NSAttributedString.Key: Any] =  [.font:  AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.black)]
            var selectedTitles = [NSAttributedString]()
            for titleString in titleStrings {
                let selectedTitle = NSAttributedString(string: titleString, attributes: attributes)
                selectedTitles.append(selectedTitle)
            }
            return selectedTitles
        }()
        
        self.roamingSegmentedControl.setTitles(titles, selectedTitles: selectedTitles)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSegmentedControl()
        self.addSubviews()
    }
    

    private func addSubviews() {
        self.view.addSubview(self.roamingSegmentedControl)
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.contentBackView)
        self.contentBackView.addSubview(self.priceComparisonView)
        
        self.updateViewConstraints()
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        
        self.roamingSegmentedControl.snp.updateConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(32)
        }
        self.scrollView.snp.updateConstraints { make in
            make.top.equalTo(self.roamingSegmentedControl.snp.bottom)
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
        self.contentBackView.snp.updateConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(120 * 3 + 32 + 4)
           
        }
        
        self.priceComparisonView.snp.updateConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
}

extension PriceComparisonViewController: SegmentedControlDelegate {
    func segmentedControl(_ segmentedControl: SegmentedControl, didSelectIndex selectedIndex: Int) {
        
        
    }
}
