//
//  API.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import Unbox


fileprivate struct URL {
    static let develop = "www.google.pl"
    static let production = "www.google.pl"
}


final class API {
    private var sessionManager: SessionManager
    private let baseURL: String
    
    init() {
        self.baseURL = URL.develop
        
        let configuration = URLSessionConfiguration()
        configuration.timeoutIntervalForRequest = 20
        
        sessionManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    func execute<T: Unboxable>(request: Request) -> Observable<T> {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        return Observable.create({ (observer) -> Disposable in
            self.dataRequest(request).responseData(completionHandler: { (response) in
                self.handle(response, observer: observer)
            })
            
            return Disposables.create()
        })
    }
    
    private func handle<T: Unboxable>(_ response: DataResponse<Data>, observer: AnyObserver<T>) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        switch response.result {
        case .success(let data):
            do {
                let items: T = try unbox(data: data)
                observer.onNext(items)
                observer.onCompleted()
            } catch let error {
                observer.onError(error)
            }
        case .failure(let error):
            observer.onError(error)
        }
    }
    
    func execute<T: Unboxable>(request: Request) -> Observable<[T]> {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        return Observable.create({ (observer) -> Disposable in
            self.dataRequest(request).responseData(completionHandler: { (response) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                switch response.result {
                case .success(let data):
                    do {
                        let items: [T] = try unbox(data: data)
                        observer.onNext(items)
                        observer.onCompleted()
                    } catch let error {
                        observer.onError(error)
                    }
                case .failure(let error):
                    observer.onError(error)
                }
            })
            return Disposables.create()
        })
    }
    
    private func handle<T: Unboxable>(_ response: DataResponse<Data>, observer: AnyObserver<[T]>) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        switch response.result {
        case .success(let data):
            do {
                let items: [T] = try unbox(data: data)
                observer.onNext(items)
                observer.onCompleted()
            } catch let error {
                observer.onError(error)
            }
        case .failure(let error):
            observer.onError(error)
        }
    }
    
    func execute(request: Request) -> Observable<Error?> {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        return Observable.create({ (observer) -> Disposable in
            self.dataRequest(request).responseData(completionHandler: { (response) in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                switch response.result {
                case .success(_):
                    observer.onNext(nil)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            })
            return Disposables.create()
        })
    }
    
    private func handle(_ response: DataResponse<Data>, observer: AnyObserver<Error?>) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        switch response.result {
        case .success(_):
            observer.onNext(nil)
            observer.onCompleted()
        case .failure(let error):
            observer.onError(error)
        }
    }
    
    
    private func dataRequest(_ request: Request) -> DataRequest {
        let url = baseURL + request.path
        return sessionManager.request(url,
                                      method: request.method,
                                      parameters: request.paramteres,
                                      encoding: request.encoding,
                                      headers: request.headers)
    }
}

