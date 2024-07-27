//
//  PokemonEndpoints.swift
//
//
//  Created by Aleksandr Milashevski on 26/07/24.
//

import Foundation

public enum PokemonEndpoints: EndpointProvider {
    case getPokemonList(offset: String)
    case getPokemonDetails(id: String)
}

// MARK: - Extensions
extension PokemonEndpoints {
    public var path: String {
        switch self {
        case .getPokemonList:
            return "/api/v2/pokemon"
        case .getPokemonDetails(id: let id):
            return "/api/v2/pokemon/\(id)"
        }
    }
    
    public var queryItems: [URLQueryItem]? {
        switch self {
        case .getPokemonList(offset: let offset):
            return [URLQueryItem(name: "offset", value: offset),
                    URLQueryItem(name: "limit", value: "100")]
        case .getPokemonDetails(id: _):
            return nil
        }
    }
    
    public var mockFile: String? {
        switch self {
        case .getPokemonList:
            return "/api/v2/pokemon"
        case .getPokemonDetails(id: let id):
            return "/api/v2/pokemon/\(id)"
        }
    }
}
