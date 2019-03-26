//
//  Countries.swift
//  FlagList
//
//  Created by Mattia on 26/03/2019.
//  Copyright © 2019 Mattia. All rights reserved.
//

import Foundation

struct Countries: Codable {
    let countries: [[Country]]
    
    enum CodingKeys: String, CodingKey {
        case countries = "Countries"
    }
}

struct Country: Codable {
    let id, name: String
    let image: String
    var checked: Bool
}
