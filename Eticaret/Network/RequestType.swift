//
//  RequestType.swift
//  Eticaret
//
//  Created by yunus oktay on 22.03.2022.
//

import Foundation

enum RequestType {
    
    static let cartId = 2
    
    case products
    case productDetail(id: Int)
    case addToCart(id: Int)
    case cart
    case removeProduct(id: Int)
    case clearCart
    
    var endPoint: String {
        switch self {
        case .products:
            return "/products"
        case .productDetail(id: let id):
            return "/products/\(id)"
        case .addToCart(id: let id):
            return "/addtocart/\(RequestType.cartId.toString())/\(id)"
        case .cart:
            return "/cart/\(RequestType.cartId)"
        case .removeProduct(id: let id):
            return "/removeproduct/\(RequestType.cartId)/\(id)"
        case .clearCart:
            return "/clearcart/\(RequestType.cartId)"
        }
    }
    
    var httpMethod: HttpMethod {
        switch self {
        case .products:
            return .GET
        case .productDetail:
            return .GET
        case .addToCart:
            return .POST
        case .cart:
            return .GET
        case .removeProduct:
            return .GET
        case .clearCart:
            return .GET
        }
    }
}
