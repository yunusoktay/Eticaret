//
//  Button+Extenison.swift
//  Eticaret
//
//  Created by yunus oktay on 24.03.2022.
//

import Foundation
import UIKit

extension UIButton {
    func customizeBtn(bacroundColor: UIColor, setTitle: String, setTextColor: UIColor) {
        self.backgroundColor = bacroundColor
        self.setTitle(setTitle, for: .normal)
        self.setTitleColor(setTextColor, for: .normal)
        
        self.layer.cornerRadius = 24
    }
}
