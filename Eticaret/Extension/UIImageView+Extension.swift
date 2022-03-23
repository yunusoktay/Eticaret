//
//  UIImageView+Extension.swift
//  Eticaret
//
//  Created by yunus oktay on 23.03.2022.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(url: String?) {
        guard let urlStr = url, let url = URL(string: urlStr) else {
            return
        }
        
        self.kf.setImage(with: url)
    }
}
