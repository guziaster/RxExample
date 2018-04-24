//
//  ViewControllerContainer.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation

final class ViewControllerContainer {
    
    static let shared = ViewControllerContainer()
    
    private init() {}
    
    func takeShopListViewController() -> ShopListViewController {
        let viewModel = ViewModelContainer.shared.takeShopListViewModel()
        let viewContrller = ShopListViewController(viewModel: viewModel)
        return viewContrller
    }
    
}
