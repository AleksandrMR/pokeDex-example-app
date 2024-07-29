//
//  ImageCache.swift
//
//
//  Created by Aleksandr Milashevski on 28/07/24.
//

import UIKit

class ImageCache {
    
    // MARK: - Let
    static let shared = ImageCache()
    
    // MARK: - private Let
    private let cache = NSCache<NSString, UIImage>()
    
    // MARK: - Flow funcs
    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
