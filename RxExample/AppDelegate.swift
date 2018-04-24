//
//  AppDelegate.swift
//  RxExample
//
//  Created by Piotr Guzia on 23.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setRootViewController()
        return true
    }
    
    private func setRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = ViewControllerContainer.shared.takeShopListViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.isNavigationBarHidden = false
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

