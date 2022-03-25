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
        
        let cartBtn = UIBarButtonItem(image: UIImage(named: "basket"), style: .plain, target: self, action: #selector(openBasketVC))
        navigationItem.rightBarButtonItem = cartBtn
        let apperance = UINavigationBarAppearance()
        apperance.backgroundColor = UIColor(named: "lightGreen")
        
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        
    }
    
    @objc func openBasketVC() {
        let cartVC = CartVC()
        self.navigationController?.pushViewController(cartVC, animated: true)
    }

}
