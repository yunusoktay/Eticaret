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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
