//
//  Request.swift
//  rxfunc
//
//  Created by Piotr Guzia on 21.02.2018.
//  Copyright © 2018 Piotr Guzia. All rights reserved.
//

import Foundation
import Alamofire

protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var paramteres: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}
