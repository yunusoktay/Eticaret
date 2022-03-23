//
//  ProductsVC.swift
//  Eticaret
//
//  Created by yunus oktay on 22.03.2022.
//

import UIKit

class ProductsVC: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var products = [Product]()
    let layout = UICollectionViewFlowLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout
        
        let nib = UINib(nibName: "ProductCell", bundle: Bundle(for: ProductCell.self))
        collectionView.register(nib, forCellWithReuseIdentifier: ProductCell.id)
        
        getData()
    }
    
    func getData() {
        Network().request(with: .products) { (result: (Result<BaseResponse<[Product]>, CustomError>)) in
            switch result {
            case .success(let response):
                if let products = response.result {
                    self.products = products
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    

}

extension ProductsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.id, for: indexPath) as? ProductCell else {
            return UICollectionViewCell()
        }
        let product = products[indexPath.item]
        cell.configureCell(product: product)
        
        return cell
    }
    
    
}

extension ProductsVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 30) / 2
        let height = width * 2
        return CGSize(width: width, height: height)
    }
}
