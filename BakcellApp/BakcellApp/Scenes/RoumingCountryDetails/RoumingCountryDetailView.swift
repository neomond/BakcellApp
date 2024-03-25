//
//  RoumingCountryDetailView.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit
import BakcellUIKit

protocol RoumingCountryDetailViewDelegate: AnyObject {
}

final class RoumingCountryDetailView: UIView, ThemeableView {
    
    var theme: ThemeProvider = App.theme
    weak var delegate: RoumingCountryDetailViewDelegate?
    
    var selectedIndex = 0
  
    lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.isPagingEnabled = false
        return pageViewController
    }()
    
    
    
    lazy var filterSegmentedControl: SegmentedControl = {
        let segmentedControl = SegmentedControl()
        segmentedControl.backgroundColor = .white
        segmentedControl.selectionBoxStyle = .default
        segmentedControl.selectionBoxColor = adaptiveColor(.main)
        segmentedControl.selectionBoxCornerRadius = 12
        segmentedControl.layoutPolicy = .dynamic
        segmentedControl.segmentSpacing = 8
        segmentedControl.selectionBoxHeight = 32
        segmentedControl.selectionHorizontalPadding = 8
        segmentedControl.contentInset = .zero
        segmentedControl.clipsToBounds = true
        segmentedControl.delegate = self
        return segmentedControl
    }()
    
    
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
    
        self.addSubviews()
        self.setupUI()
        self.setupInitialViewController()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSegmentedControl(withTitles titles: [String]) {
           let normalAttributes = [NSAttributedString.Key.font: AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.black)]
           let selectedAttributes = [NSAttributedString.Key.font: AppFonts.SFRegularSubheadline.fontStyle, .foregroundColor: adaptiveColor(.whitePrimary)]
           
           let attributedTitles = titles.map { NSAttributedString(string: $0, attributes: normalAttributes) }
           let selectedAttributedTitles = titles.map { NSAttributedString(string: $0, attributes: selectedAttributes) }
           
           filterSegmentedControl.setTitles(attributedTitles, selectedTitles: selectedAttributedTitles)
       }
    
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.pageViewController.view.snp.updateConstraints { make in
            make.top.equalTo(self.filterSegmentedControl.snp.bottom)
            make.horizontalEdges.bottom.equalToSuperview()
        }
        
        self.filterSegmentedControl.snp.updateConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
        }
    }
    
    private lazy var operatorsViewController = OperatorsViewController()
    private lazy var priceComparisonViewController = PriceComparisonViewController()

    private lazy var viewControllers: [UIViewController] = [operatorsViewController, priceComparisonViewController]

    
    private func showViewController(at index: Int) {
        pageViewController.setViewControllers([viewControllers[index]], direction: .forward, animated: true, completion: nil)
        self.selectedIndex = index
    }
    
    @objc private func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        showViewController(at: sender.selectedSegmentIndex)
    }
    
    
    
    // MARK: - Private
    
    private func addSubviews() {
      
        self.addSubview(self.filterSegmentedControl)
        self.addSubview(self.pageViewController.view)
        self.updateConstraints()
    }
    
    private func setupUI() {
        self.backgroundColor = adaptiveColor(.grayPrimary)
    }
    
    private func setupInitialViewController() {
        self.selectedIndex = 0
        self.showViewController(at: selectedIndex)
    }
    

}

extension RoumingCountryDetailView: SegmentedControlDelegate {
    
    func segmentedControl(_ segmentedControl: SegmentedControl, didSelectIndex selectedIndex: Int) {
    
            self.selectedIndex = selectedIndex
            showViewController(at: self.selectedIndex)
        }
    }




extension RoumingCountryDetailView: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllers.firstIndex(of: viewController), currentIndex > 0 else {
            return nil
        }
        return viewControllers[currentIndex - 1]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = viewControllers.firstIndex(of: viewController), currentIndex < viewControllers.count - 1 else {
            return nil
        }
        return viewControllers[currentIndex + 1]
    }
}
