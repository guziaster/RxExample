//
//  ShopListService.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation

final class ShopListService: ShopListServiceProtocol {
    
    //    only mock - instead of this should be working API
    private var elements = [
        ListPosition(id: 0,
                     creationDate: Date(),
                     items: [
                        ListItem(id: 0, productName: "Jabłko", isRealised: false, amount: 2),
                        ListItem(id: 1, productName: "Gruszka", isRealised: false, amount: 2),
                        ListItem(id: 2, productName: "Pietruszka", isRealised: false, amount: 2)
            ]
        ),
        ListPosition(id: 1,
                     creationDate: Date(),
                     items: [
                        ListItem(id: 3, productName: "Masło", isRealised: false, amount: 2),
                        ListItem(id: 4, productName: "Mleko", isRealised: false, amount: 2),
                        ListItem(id: 5, productName: "Kawa", isRealised: false, amount: 2)
            ]
        ),
        ListPosition(id: 2,
                     creationDate: Date(),
                     items: [
                        ListItem(id: 6, productName: "Sok pomarańczowy", isRealised: false, amount: 2),
                        ListItem(id: 7, productName: "Sok jabłkowy", isRealised: false, amount: 2),
                        ListItem(id: 8, productName: "Ciastka czekoladowe", isRealised: false, amount: 10)
            ]
        ),
        ]
    
    func downloadData() -> [ListPosition] {
        return elements
    }
    
    func addNewElement() {
        elements.append(ListPosition(id: 1,
                         creationDate: Date(),
                         items: [
                            ListItem(id: 11, productName: "Masło", isRealised: false, amount: 2),
                            ListItem(id: 12, productName: "Mleko", isRealised: false, amount: 2),
                            ListItem(id: 13, productName: "Kawa", isRealised: false, amount: 2)
            ]
        ))
    }
}
