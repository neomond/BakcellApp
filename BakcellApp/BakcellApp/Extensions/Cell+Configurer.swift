//
//  Cell+Configurer.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 18.02.24.
//

import UIKit

public protocol CellConfigurer: AnyObject {
    static var reuseIdentifier: String {get}
}

public extension CellConfigurer {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: CellConfigurer { }
