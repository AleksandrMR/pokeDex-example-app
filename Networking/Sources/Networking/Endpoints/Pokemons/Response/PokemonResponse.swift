//
//  PokemonResponse.swift
//
//
//  Created by Aleksandr Milashevski on 26/07/24.
//

import Foundation

public struct PokemonResponse: Decodable {
    public let count: Int
    public let next: String
    public let previous: String?
    public let results: [Pokemon]
}

public struct Pokemon: Decodable {
    public let name: String
    public let detailsUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case detailsUrl = "url"
    }
}
