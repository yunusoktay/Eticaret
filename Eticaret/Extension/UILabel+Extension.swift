//
//  UILabel+Extension.swift
//  Eticaret
//
//  Created by yunus oktay on 23.03.2022.
//

import Foundation
import UIKit

extension UILabel {
    func setStroke() {
        let mutableString = NSMutableAttributedString(string: self.text!)
        mutableString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSRange(location:    0, length: mutableString.length))
    
        self.attributedText = mutableString
    }
}
