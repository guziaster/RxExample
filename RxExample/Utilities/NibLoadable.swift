//
//  NibLoadable.swift
//  RxExample
//
//  Created by Piotr Guzia on 24.04.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation
import UIKit

public protocol NibLoadable: class { }

extension NibLoadable where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
}
