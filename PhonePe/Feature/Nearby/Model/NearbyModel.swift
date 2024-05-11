//
//  NearbyModel.swift
//  PhonePe
//
//  Created by Ravi Ranjan on 11/05/24.
//

import Foundation
struct NearByLocation: Codable {
    let venues: [Venue]?
}

struct Venue: Codable {
    let name: String?
    let address: String?
    let city: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case address
        case city
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        address = try container.decodeIfPresent(String.self, forKey: .address) ?? ""
        city = try container.decodeIfPresent(String.self, forKey: .city) ?? ""
    }
}
