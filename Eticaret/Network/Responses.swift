//
//  Responses.swift
//  Eticaret
//
//  Created by yunus oktay on 22.03.2022.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let status: String?
    let statusCode: Int?
    let result: T?
    let message: String?
}

struct Product: Codable {
    let id: Int?
    let productName: String?
    let type: String?
    let oldPrice: Double?
    let newPrice: Double?
    let productImage: String?
    let quantity: Int?
}

struct CartResponse: Codable {
    let id: Int?
    let products: [Product]?
}
