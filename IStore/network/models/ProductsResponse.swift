//
//  Product.swift
//  IStore
//
//  Created by Felix kariuki on 17/01/2024.
//

import Foundation

// MARK: - ProductItemResponse
struct ProductItemResponse: Codable,Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
    
}


// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

typealias ProductsResponse = [ProductItemResponse]

extension ProductItemResponse {
    static var sampleProductItem: ProductItemResponse{
        .init(id: 1, title: "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops", price: 109.98, description: "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday", category: "men's clothing", image: "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg", rating: Rating(rate: 3.9, count: 120))
    }
}

