//
//  ShopListServiceProtocol.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation

protocol ShopListServiceProtocol: class {
    func downloadData() -> [ListPosition]
    func addNewElement() -> ListPosition
}
