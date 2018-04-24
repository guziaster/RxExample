//
//  ListPosition.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation

public struct ListPosition {
    public let id: Int
    public let creationDate: Date
    public let items: [ListItem]
    
    public init(id: Int, creationDate: Date, items: [ListItem]) {
        self.id = id
        self.creationDate = creationDate
        self.items = items
    }
}
