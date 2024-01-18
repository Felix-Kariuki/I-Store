//
//  IstoreViewModel.swift
//  IStore
//
//  Created by Felix kariuki on 17/01/2024.
//

import Foundation
import Combine

protocol IstoreViewModel {
    func getAllProducts()
    func getProductById(id:Int)
}

class IstoreViewModelImpl : ObservableObject, IstoreViewModel{
    
    
    
    private let apiService: IstoreApiService
    
    private(set) var products = ProductsResponse()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: UiState = .loading
    
    init( apiservice: IstoreApiService) {
        self.apiService = apiservice
    }
    
    func getAllProducts() {
        self.state = .loading
        
        let cancellable = apiService.request(from: .getProducts)
            .sink { res in
                switch res {
                    
                case .finished:
                    self.state = .products(results: self.products)
                   
                case .failure(let error):
                    self.state = .failed(error: error)
                
                }
            } receiveValue: { response in
                self.products = response
            }
        
        self.cancellables.insert(cancellable)
    }
    
    func getProductById(id: Int) {
        <#code#>
    }
    
}
