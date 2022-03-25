//
//  BaseViewController.swift
//  Eticaret
//
//  Created by yunus oktay on 22.03.2022.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image: logo)
        
        self.navigationItem.titleView = imageView
        
        let backBtn = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationItem.backBarButtonItem = backBtn
        navigationItem.backBarButtonItem?.tintColor = .black
        
       
        
        
    }
    
    

}
