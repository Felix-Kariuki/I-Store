//
//  UiState.swift
//  IStore
//
//  Created by Felix kariuki on 17/01/2024.
//

import Foundation

enum UiState {
    case loading
    case products(results: ProductsResponse)
    case users(results: UsersResponse)
    case cartItems(results: CartItemsResponse)
    case failed(error:Error)
}
