//
//  Pokemon.swift
//  pokeDex-example-app
//
//  Created by Aleksandr Milashevski on 27/07/24.
//

import SwiftUI

struct Pokemon: Identifiable, Hashable, Equatable {
    let id: Int
    let name: String
    let image: UIImage?
    let details: Details?
    
    init(id: Int, name: String, image: UIImage?, details: Details?) {
        self.id = id
        self.name = name
        self.image = image
        self.details = details
    }
}

struct Details: Equatable, Hashable {
    let type: String
    let height: String
    let weight: String
    
    init(type: String, height: String, weight: String) {
        self.type = type
        self.height = height
        self.weight = weight
    }
}
