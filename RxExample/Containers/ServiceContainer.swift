//
//  ServiceContainer.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation

final class ServiceContainer {
    
    static let shared = ServiceContainer()
    
    private init() { }
    
    func takeShopListService() -> ShopListServiceProtocol {
        let shopListService = ShopListService()
        return shopListService
    }
    
}
