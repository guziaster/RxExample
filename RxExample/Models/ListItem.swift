//
//  ListItem.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation

public struct ListItem {
    public let id: Int
    public let productName: String
    public let isRealised: Bool
    public let amount: Int
    
    public init(id: Int, productName: String, isRealised: Bool, amount: Int) {
        self.id = id
        self.productName = productName
        self.isRealised = isRealised
        self.amount = amount
    }
}
