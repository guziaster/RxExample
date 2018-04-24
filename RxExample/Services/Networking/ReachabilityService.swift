//
//  ReachabilityService.swift
//  rxfunc
//
//  Created by Piotr Guzia on 21.02.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

final class ReachabilityService {
    static let shared = ReachabilityService()
    
    private let manager: NetworkReachabilityManager
    private let reachableSubject = BehaviorSubject<Bool>(value: false)
    
    private init() {
        guard let instance = NetworkReachabilityManager(host: "www.google.com") else {
            fatalError("Cannot instiantiate manager")
        }
        
        manager = instance
        manager.listener = { [reachableSubject] status in
            switch status {
            case .notReachable:
                reachableSubject.onNext(false)
            case .unknown:
                break
            case .reachable(.ethernetOrWiFi):
                reachableSubject.onNext(true)
            case .reachable(.wwan):
                reachableSubject.onNext(true)
            }
        }
        
        manager.startListening()
    }
    
    func isReachable() -> Observable<Bool> {
        return reachableSubject
    }
}
