//
//  ImageWithParallax.swift
//
//
//  Created by Aleksandr Milashevski on 28/07/24.
//

import SwiftUI
import AssetKit

public struct ImageWithParallax: View {
    
    // MARK: - private Let
    private let headerHeight: CGFloat = 480
    private let circleHeight: CGFloat = 350
    private let imgPath: String
    
    // MARK: - Initialization func
    public init(imgPath: String) {
        self.imgPath = imgPath
    }
    
    // MARK: - Body
    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                Circle()
                    .offset(y: -geometry.frame(in: .global).minY)
                    .frame(width: UIScreen.main.bounds.width,
                           height:  geometry.frame(in: .global).minY > 0 ? geometry.frame(in: .global).minY + circleHeight : circleHeight)
                    .foregroundColor(AKColors.yellowb3a125.color)
                    .shadow(color: AKColors.yellowb3a125.color ,radius: 10)
                AsyncImage(url: URL(string: imgPath)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .padding()
                .offset(y: -geometry.frame(in: .global).minY)
                .frame(width: UIScreen.main.bounds.width,
                       height:  geometry.frame(in: .global).minY > 0 ? geometry.frame(in: .global).minY + headerHeight : headerHeight)
            }
        }
        .frame(height: headerHeight)
    }
}

// MARK: - Preview
#Preview {
    ImageWithParallax(imgPath: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/6.png")
}
