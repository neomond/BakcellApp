//
//  Protocols.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit

public protocol SegmentedControlDelegate: AnyObject {
    func segmentedControl(_ segmentedControl: SegmentedControl, didSelectIndex selectedIndex: Int)
    func segmentedControl(_ segmentedControl: SegmentedControl, didLongPressIndex longPressIndex: Int)
}

public extension SegmentedControlDelegate {
    func segmentedControl(_ segmentedControl: SegmentedControl, didSelectIndex selectedIndex: Int) {

    }

    func segmentedControl(_ segmentedControl: SegmentedControl, didLongPressIndex longPressIndex: Int) {

    }
}
