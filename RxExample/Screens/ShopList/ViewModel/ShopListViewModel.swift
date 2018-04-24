//
//  ShopListViewModel.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class ShopListViewModel: ShopListViewModelProtocol {
    
    private let service: ShopListServiceProtocol
    private let disposeBag = DisposeBag()
    
    var addAction: PublishSubject<Void> = PublishSubject<Void>()
    var deleteAction: PublishSubject<Void> = PublishSubject<Void>()
    
    var listPositions: Variable<[ListPosition]> = Variable<[ListPosition]>([])
    
    init(service: ShopListServiceProtocol) {
        self.service = service
        
        observeInputs()
    }
    
    func fetchData() {
        let listOfElements = service.downloadData()
        listPositions.value.append(contentsOf: listOfElements)
    }
    
    private func observeInputs() {
        addAction.asObservable().observeOn(MainScheduler.instance).subscribe { (_) in
           self.listPositions.value.append(self.service.addNewElement())
        }.disposed(by: disposeBag)
        
        deleteAction.asObservable().subscribe { (_) in
            self.deleteLastElement()
        }.disposed(by: disposeBag)
    }
    
    private func deleteLastElement() {
        guard !listPositions.value.isEmpty else {
            return
        }
        
        _ = listPositions.value.removeLast()
    }
    
}
