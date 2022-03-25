//
//  CartCell.swift
//  Eticaret
//
//  Created by yunus oktay on 25.03.2022.
//

import UIKit

protocol CartCellProtocol: AnyObject {
    func removeProduct(id: Int)
}

class CartCell: UITableViewCell {

    static let id = "cell"
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    weak var delegate: CartCellProtocol?
    
    var product: Product?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell() {
        productImageView.setImage(url: product?.productImage)
        productNameLabel.text = product?.productName
        productPriceLabel.text = product?.newPrice?.toString()
    }
    
    @IBAction func deleteBtnAction(_ sender: Any) {
        guard let id = product?.id else {return}
        delegate?.removeProduct(id: id)
    }
    
    override func prepareForReuse() {
        productImageView.image = nil
        productNameLabel.text = nil
        productPriceLabel.text = nil
    }
}
