//
//  InfoProtocol.swift
//  PhonePe
//
//  Created by Ravi Ranjan on 11/05/24.
//

import Foundation
protocol InfoProtocol {
    
    var info: String {get}
    var debugInfo: String {get}
}

extension InfoProtocol {
    
    var debugInfo: String {
        return "Use this to get info for debug"
    }
}
