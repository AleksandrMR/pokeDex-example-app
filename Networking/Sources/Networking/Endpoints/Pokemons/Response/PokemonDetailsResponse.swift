//
//  PokemonDetailsResponse.swift
//
//
//  Created by Aleksandr Milashevski on 26/07/24.
//

import Foundation

public struct PokemonDetailsResponse: Decodable {
    public let abilities: [Ability]?
    public let base_experience: Int?
    public let cries: Cries?
    public let forms: [Form]?
    public let game_indices: [GameIndex]?
    public let height: Int
    public let held_items: [HeldItem]?
    public let id: Int
    public let is_default: Bool
    public let location_area_encounters: String
    public let moves: [Move]?
    public let name: String
    public let order: Int
    public let past_abilities: [PastAbility]?
    public let past_types: [PastType]?
    public let species: Species?
    public let sprites: Sprites?
    public let stats: [Stat]?
    public let types: [Types]?
    public let weight: Int
}

public struct Ability: Decodable {
    
}

public struct Cries: Decodable {
    
}

public struct Form: Decodable {
    
}

public struct GameIndex: Decodable {
    
}

public struct HeldItem: Decodable {
    
}

public struct Move: Decodable {
    
}

public struct PastAbility: Decodable {
    
}

public struct PastType: Decodable {
    
}

public struct Species: Decodable {
    
}

public struct Sprites: Decodable {
    
}

public struct Stat: Decodable {
    
}

public struct Types: Decodable {
    public let slot: Int
    public let type: PokType
}

public struct PokType: Decodable {
    public let name: String
    public let url: String
}
