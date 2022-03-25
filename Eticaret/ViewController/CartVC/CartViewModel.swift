//
//  CartViewModel.swift
//  Eticaret
//
//  Created by yunus oktay on 25.03.2022.
//

import Foundation

protocol CartViewModelProtocol: AnyObject {
    func didFinishCartOperation()
    func removeProduct()
    func buyCart()
}


class CartViewModel {
    
    private let network = Network()
    weak var delegate: CartViewModelProtocol?
    var products = [Product]()
    
    func getCartData() {
        network.request(with: .cart) { (result: Result<BaseResponse<CartResponse>, CustomError>) in
            switch result {
            case .success(_):
                self.didFinish(result: result)
                self.delegate?.didFinishCartOperation()
            case .failure(let failure):
                print("main error, \(failure)")
            }
        }
    }
    
    func removeProduct(id: Int) {
        network.request(with: .removeProduct(id: id)) { (result: Result<BaseResponse<CartResponse>, CustomError>) in
            self.didFinish(result: result)
            self.delegate?.removeProduct()
        }
    }
    
    func buyCart() {
        network.request(with: .clearCart) { (result: Result<BaseResponse<CartResponse>, CustomError>) in
            self.didFinish(result: result)
            self.delegate?.buyCart()
        }
    }
    
    func didFinish(result: Result<BaseResponse<CartResponse>, CustomError>) {
        switch result {
        case .success(let succes):
            guard let products = succes.result?.products else {return}
            self.products = products
        case .failure(let error):
            print(error)
        }
    }
}



