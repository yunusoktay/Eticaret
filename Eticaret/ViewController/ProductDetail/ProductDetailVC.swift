//
//  ProductDetailVC.swift
//  Eticaret
//
//  Created by yunus oktay on 24.03.2022.
//

import UIKit

class ProductDetailVC: BaseViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var whichStoreBtn: UIButton!
    @IBOutlet weak var addToCartBtn: UIButton!
    
    var product: Product?
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productImageView.setImage(url: product?.productImage)
        productNameLabel.text = product?.productName
        priceLabel.text = product?.newPrice?.toString()
        
        whichStoreBtn.customizeBtn(bacroundColor: .lightGray, setTitle: "Hangi Mağazada Var", setTextColor: .black)
        addToCartBtn.customizeBtn(bacroundColor: UIColor(named: "btnGreen")!, setTitle: "Sepete Ekle", setTextColor: .white)
    }

    @IBAction func whichStoreAction(_ sender: Any) {
        
    }
    
    @IBAction func addToCartAction(_ sender: Any) {
    }
    
    
}
