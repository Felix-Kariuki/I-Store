//
//  CartItemsResponse.swift
//  IStore
//
//  Created by Felix kariuki on 17/01/2024.
//

import Foundation


// MARK: - CartItemResponse
struct CartItemResponse: Codable {
    let id, userID: Int
    let date: String
    let products: [Product]
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case date, products
    }
}

// MARK: - Product
struct Product: Codable {
    let productID, quantity: Int
    
    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case quantity
    }
}

typealias CartItemsResponse = [CartItemResponse]


extension CartItemResponse {
    static var sampleCartItem: CartItemResponse{
        .init(id: 1, userID: 1, date: "2020-03-02T00:00:00.000Z", products: [
            Product(productID: 1, quantity: 4)
        ])
    }
}


