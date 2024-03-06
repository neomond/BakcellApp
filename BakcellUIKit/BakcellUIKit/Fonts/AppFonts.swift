//
//  AppFonts.swift
//  BakcellUIKit
//
//  Created by Nazrin Atayeva on 06.03.24.
//

import UIKit

public enum AppFonts {
    case SFBoldHeadline
    case SFRegularBody
    case SFBoldFootnote
    case SFBoldLargeTitle
    case SFBoldTitle2
    case SFBoldTitle3
    case SFBoldCardTitle
    case SFBoldCaption1
    case SFBoldCaptionBold
    case SFRegularCaption1
    case SFRegularSubheadline
    case SFBoldSubheadline
    case SFBoldCallout
    case SFBoldCaption3
}

extension AppFonts {
    public var fontStyle: UIFont {
        
        switch self {
        case .SFBoldHeadline:
            return .systemFont(ofSize: 17, weight: .semibold)
        case .SFRegularBody:
            return .systemFont(ofSize: 17, weight: .regular)
        case .SFBoldFootnote:
            return .systemFont(ofSize: 13, weight: .semibold)
        case .SFBoldLargeTitle:
            return .systemFont(ofSize: 34, weight: .bold)
        case .SFBoldTitle2:
            return .systemFont(ofSize: 22, weight: .bold)
        case .SFBoldTitle3:
            return .systemFont(ofSize: 20, weight: .semibold)
        case .SFBoldCardTitle:
            return .systemFont(ofSize: 17, weight: .bold)
        case .SFBoldCaption1:
            return .systemFont(ofSize: 12, weight: .medium)
        case .SFBoldCaptionBold:
            return .systemFont(ofSize: 12, weight: .bold)
        case .SFRegularCaption1:
            return .systemFont(ofSize: 12, weight: .medium)
        case .SFRegularSubheadline:
            return .systemFont(ofSize: 15, weight: .regular)
        case .SFBoldSubheadline:
            return .systemFont(ofSize: 15, weight: .semibold)
        case .SFBoldCallout:
            return .systemFont(ofSize: 16, weight: .semibold)
        case .SFBoldCaption3:
            return .systemFont(ofSize: 12, weight: .bold)
        }
    }
}
