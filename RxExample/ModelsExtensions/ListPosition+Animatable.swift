//
//  ListPosition+Animatable.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation
import RxDataSources


struct ListPositionSection {
    let header: String
    var items: [Item]
}

extension ListPositionSection: AnimatableSectionModelType {
    typealias Item = ListPosition
    
    var identity: String {
        return header
    }
    
    init(original: ListPositionSection, items: [Item]) {
        self = original
        self.items = items
    }
}

extension ListPosition: Equatable {
    public static func ==(lhs: ListPosition, rhs: ListPosition) -> Bool {
        return lhs.id == rhs.id
    }
}

extension ListPosition: IdentifiableType {
    public typealias Identity = Int
    
    public var identity : Identity { return id }
}

