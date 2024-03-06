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
    
//    lazy var contentTableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .plain)
//        tableView.separatorStyle = .none
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.backgroundColor = .red
//        tableView.contentInset = .zero
//        tableView.alwaysBounceHorizontal = true
//        tableView.register(OperatorViewCell.self, forCellReuseIdentifier: OperatorViewCell.reuseIdentifier)
//
//        tableView.register(PriceComparisonViewCell.self, forCellReuseIdentifier: PriceComparisonViewCell.reuseIdentifier)
//        return tableView
//
//    }()
//
   
    
    //MARK: Init
    
    init() {
        super.init(frame: .zero)
    
        self.addSubviews()
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
//        self.backViewForRoamingSegmentedControl.snp.updateConstraints { make in
//            make.height.equalTo(64)
//            make.width.equalToSuperview()
//        }
//
//        self.roamingSegmentedControl.snp.updateConstraints { make in
//            make.edges.equalToSuperview().inset(16)
//        }
        
//            self.contentTableView.snp.updateConstraints { make in
//                make.top.equalTo(self.filterSegmentedControl.snp.bottom)
//                make.bottom.equalToSuperview()
//                make.width.equalTo(120 + 120 + 120 + 16 + 4)
//            }
//
//
//        // Set a fixed height for the tableHeaderView
//        if let headerView = self.contentTableView.tableHeaderView {
//            headerView.frame.size.height = 64
//        }
        
    }
    
    private lazy var firstViewController = UIViewController()
    private lazy var operatorsViewController = OperatorsViewController()
    private lazy var priceComparisonViewController = PriceComparisonViewController()

    private lazy var viewControllers: [UIViewController] = [firstViewController, operatorsViewController, priceComparisonViewController]

    
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
