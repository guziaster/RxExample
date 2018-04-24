//
//  ShopListService.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation

final class ShopListService: ShopListServiceProtocol {
    
    func downloadData() -> [ListPosition] {
        var mockList: [ListPosition] = []
        
        for index in 0...5 {
            let listItem = ListItem(id: index, productName: "Product \(index)", isRealised: false, amount: index * 2)
            let listItem2 = ListItem(id: index, productName: "Product \(index)", isRealised: false, amount: index * 2)
            let items: [ListItem] = [listItem, listItem2]
            mockList.append(ListPosition(id: index, creationDate: Date(), items: items))
        }
        
        return mockList
    }
    
    func addNewElement() -> ListPosition {
        return ListPosition(id: UUID().hashValue ,
                            creationDate: Date(),
                            items: [
                                ListItem(id: UUID().hashValue , productName: "Masło", isRealised: false, amount: 2),
                                ListItem(id: UUID().hashValue , productName: "Mleko", isRealised: false, amount: 3),
                                ListItem(id: UUID().hashValue , productName: "Kawa", isRealised: false, amount: 4)
                ])
    }
}
