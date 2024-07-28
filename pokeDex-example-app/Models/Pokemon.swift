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
    let imgPath: String
    var details: Details
    
    init(id: Int, name: String, image: UIImage?, imgPath: String, details: Details) {
        self.id = id
        self.name = name
        self.image = image
        self.imgPath = imgPath
        self.details = details
    }
}

struct Details: Equatable, Hashable {
    var type: String
    var height: String
    var weight: String
    
    init(type: String, height: String, weight: String) {
        self.type = type
        self.height = height
        self.weight = weight
    }
    
    init() {
        type = ""
        height = ""
        weight = ""
    }
}
