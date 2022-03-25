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
        let mapVC = MapVC()
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    @IBAction func addToCartAction(_ sender: UIButton) {
        let network = Network()
        guard let id = product?.id else {return}
        network.request(with: .addToCart(id: id)) { (result: Result<BaseResponse<CartResponse>, CustomError>) in
            switch result {
            case .success(let success):
                if success.statusCode == 200 {
                    self.cartSucces()
                }
            case .failure(let failure):
                print("Sepet Hatası \(failure.message)")
            }
        }
        
    }
    
    func cartSucces() {
        DispatchQueue.main.async {
            let popup  = PopUpVC(text: "Sepete Eklendi", buttonTitle: "Anasayfaya git", doneAction: self.popUpAction)
            popup.modalPresentationStyle = .overCurrentContext
            popup.modalTransitionStyle = .crossDissolve
            self.navigationController?.present(popup, animated: false)
        }
    }
    
    func popUpAction() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}
