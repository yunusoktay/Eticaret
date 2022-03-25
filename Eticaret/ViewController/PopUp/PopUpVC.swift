//
//  PopUpVC.swift
//  Eticaret
//
//  Created by yunus oktay on 24.03.2022.
//

import UIKit

class PopUpVC: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    var text: String
    var buttonTitle: String
    var doneAction: () -> Void
    
    init(text: String, buttonTitle: String, doneAction: @escaping () -> Void) {
        self.text = text
        self.buttonTitle = buttonTitle
        self.doneAction = doneAction
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = text
        doneBtn.setTitle(buttonTitle, for: .normal)
    }

    @IBAction func doneAction(_ sender: Any) {
        self.dismiss(animated: true, completion: doneAction)
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
