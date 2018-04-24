//
//  ShopListViewModelProtocol.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation
import RxSwift

protocol ShopListViewModelProtocol: class {
    var addAction: PublishSubject<Void> { get }
    var deleteAction: PublishSubject<Void> { get }
    
    var listPositions: Variable<[ListPosition]> { get }
    
    func fetchData()
}
