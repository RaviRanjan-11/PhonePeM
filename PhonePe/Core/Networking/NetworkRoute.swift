//
//  NetworkRoute.swift
//  PhonePe
//
//  Created by Ravi Ranjan on 11/05/24.
//

import Foundation


protocol NetworkRoute {
    var path: String? { get }
    var httpMethod: HTTPMethod { get }
    var parameter: [String: Any] {get}
    
}
