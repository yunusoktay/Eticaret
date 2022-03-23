//
//  ProductCell.swift
//  Eticaret
//
//  Created by yunus oktay on 23.03.2022.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    static let id = "cell"

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var newPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(product: Product?) {
        if let product = product, let productName = product.productName, let type = product.type, let oldPrice = product.oldPrice, let newPrice = product.newPrice, let imageUrl = product.productImage {
            productNameLabel.text = productName
            typeLabel.text = type
            oldPriceLabel.text = oldPrice.toString()
            oldPriceLabel.setStroke()
            newPriceLabel.text = newPrice.toString()
            productImageView.setImage(url: imageUrl)
        } else {
            print("Product Cell Error")
        }
    }

}
