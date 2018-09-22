//
//  starWarsCharacter.swift
//  StarWars
//
//  Created by Cameron Latham on 9/22/18.
//  Copyright © 2018 Cameron Latham. All rights reserved.
//

import Foundation

struct starWarsCharacter: Decodable {
    
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let image: String
    
//    init(name: String, height: String, mass: String, hairColor: String, skinColor: String, eyeColor: String, birthYear: String, gender: String, image: String){
//        self.name = name
//        self.height = height
//        self.mass = mass
//        self.hairColor = hairColor
//        self.skinColor = skinColor
//        self.eyeColor = eyeColor
//        self.birthYear = birthYear
//        self.gender = gender
//        self.image = image
//    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
        case image
    }
    
}
