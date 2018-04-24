//
//  ViewModelContainer.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation

final class ViewModelContainer {
    
    static let shared = ViewModelContainer()
    
    private init() {}
    
    func takeShopListViewModel() -> ShopListViewModelProtocol {
        let service = ServiceContainer.shared.takeShopListService()
        let shopListViewModel = ShopListViewModel(service: service)
        return shopListViewModel
    }
    
}
