//
//  ImageLoader.swift
//
//
//  Created by Aleksandr Milashevski on 28/07/24.
//

import SwiftUI


public class ImageLoader {
    
    // MARK: - Let
    public static let shared = ImageLoader()
    
    // MARK: - Flow funcs
    public func loadImage(from url: String) async -> UIImage? {
        guard let requestUrl = URL(string: url) else { return nil }
        
        if let cachedImage = ImageCache.shared.getImage(forKey: url) {
            return cachedImage
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: requestUrl)
            guard let img = UIImage(data: data) else { return nil }
            
            ImageCache.shared.setImage(img, forKey: url)
            return img
        } catch {
            return nil
        }
    }
}
