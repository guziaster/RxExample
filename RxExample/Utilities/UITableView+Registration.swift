//
//  UITableView+Registration.swift
//  RxExample
//
//  Created by Piotr Guzia on 24.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type) where T: Reusable, T: NibLoadable {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: Reusable {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Can't dequeue cell with id: \(T.reuseIdentifier)")
        }
        return cell
    }
    
}
