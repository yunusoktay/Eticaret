//
//  CartVC.swift
//  Eticaret
//
//  Created by yunus oktay on 25.03.2022.
//

import UIKit

class CartVC: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = CartViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = nil
        
        viewModel.delegate = self
        
        let nib = UINib(nibName: "CartCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: CartCell.id)
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.fetchCartData()
    }

    @IBAction func buyAction(_ sender: Any) {
        viewModel.buyCart()
    }

}

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell:CartCell = self.tableView.dequeueReusableCell(withIdentifier: CartCell.id, for: indexPath) as? CartCell {
            cell.delegate = self
            cell.product = viewModel.products[indexPath.row]
            cell.configureCell()
            return cell
        } else {
            return UITableViewCell()
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
        }
    }
    
    
}

extension CartVC: CartCellProtocol {
    func removeProduct(id: Int) {
        print("cell protocol")
        viewModel.removeProduct(id: id)
    }
}

extension CartVC: CartViewModelProtocol {
    func didFinishCartOperation() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func removeProduct() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func buyCart() {
        
    }
}
