//
//  CategoriesResponse.swift
//  IStore
//
//  Created by Felix kariuki on 17/01/2024.
//

import Foundation


typealias CategoriesResponse = [String]

extension CategoriesResponse {
    static var sampleCategories: CategoriesResponse{
        .init(["electronics","jewerely"])
    }
}
