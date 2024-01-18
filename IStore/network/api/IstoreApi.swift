//
//  IstoreApi.swift
//  IStore
//
//  Created by Felix kariuki on 17/01/2024.
//

import Foundation

let BASE_URL = "https://fakestoreapi.com"

protocol ApiBuilder {
    var urlRequest : URLRequest { get }
    var baseUrl : URL { get }
    var path:String { get }
}

enum IstoreApi {
    case getProducts
    case getCategories
    case getCarts
    case getAllUsers
    case getSingleUser(userId:Int)
    case getSingleProduct(productId:Int)
}



extension IstoreApi: ApiBuilder {
    
    
    var urlRequest: URLRequest {
        let request = URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        return request
    }
    
    var baseUrl: URL {
        switch self {
        case .getProducts,.getCategories,.getCarts,.getAllUsers:
            return URL(string: BASE_URL)!
        case .getSingleUser( _ ),.getSingleProduct(_):
            return URL(string: BASE_URL)!
            
        }
    }
    
    var path: String {
        switch self {
        case .getProducts:
            return "/products"
        case .getCategories:
            return "/categories"
        case .getCarts :
            return "/carts"
        case .getAllUsers:
            return "/users"
        case .getSingleUser(let id):
            return "/users/\(id)"
            
        case .getSingleProduct(let id):
            return "/products/\(id)"
        }
        
    }
    
}
