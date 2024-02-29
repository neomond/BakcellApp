//
//  BulletTextFormatter.swift
//  BakcellApp
//
//  Created by Nazrin Atayeva on 28.02.24.
//


import UIKit


extension UILabel {

    func setBulletText(_ texts: [String], font: UIFont, bulletColor: UIColor = .black, textColor: UIColor = .black, lineSpacing: CGFloat = 4) {
        let fullAttributedString = NSMutableAttributedString()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = lineSpacing
        paragraphStyle.paragraphSpacingBefore = lineSpacing

       
        let bullet = "•\u{00A0}"
        let bulletAttributes = [NSAttributedString.Key.font: font]
        let bulletWidth = bullet.size(withAttributes: bulletAttributes).width
        
      
        paragraphStyle.headIndent = bulletWidth + 5
        paragraphStyle.firstLineHeadIndent = 0
        
        for text in texts {
            let bulletAttributedString = NSAttributedString(string: bullet, attributes: [.font: font, .foregroundColor: bulletColor])
            let textAttributedString = NSAttributedString(string: text, attributes: [.font: font, .foregroundColor: textColor])
            
            fullAttributedString.append(bulletAttributedString)
            fullAttributedString.append(textAttributedString)
            fullAttributedString.append(NSAttributedString(string: "\n"))
        }
        
        if !texts.isEmpty {
            fullAttributedString.deleteCharacters(in: NSRange(location: fullAttributedString.length - 1, length: 1))
        }
        
        self.attributedText = fullAttributedString
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
    }
    
}
