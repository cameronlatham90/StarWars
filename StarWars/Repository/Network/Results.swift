//
//  Response.swift
//  StarWars
//
//  Created by Cameron Latham on 9/22/18.
//  Copyright © 2018 Cameron Latham. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let starWarsCharacters: [starWarsCharacter]
    
    enum CodingKeys: String, CodingKey {
        case starWarsCharacters = "results"
    }
}
