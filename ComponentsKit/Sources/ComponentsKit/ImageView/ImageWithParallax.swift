//
//  ImageWithParallax.swift
//
//
//  Created by Aleksandr Milashevski on 28/07/24.
//

import SwiftUI
import AssetKit

public struct ImageWithParallax: View {
    
    public enum ImageType {
        case image
        case asyncImage
    }
    
    // MARK: - private Let
    private let headerHeight: CGFloat = 480
    private let circleHeight: CGFloat = 350
    private let imageType: ImageType
    private let image: Image?
    private var imgPath: String?
    
    // MARK: - Initialization func
    public init(imageType: ImageType,
                image: Image? = nil,
                imgPath: String? = nil) {
        self.imageType = imageType
        self.imgPath = imgPath
        self.image = image
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
                itemImage(geometry: geometry)
            }
        }
        .frame(height: headerHeight)
    }
}

// MARK: - Extensions
private extension ImageWithParallax {
    @ViewBuilder func itemImage(geometry: GeometryProxy) -> some View {
        switch imageType {
        case .image:
            image?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
                .offset(y: -geometry.frame(in: .global).minY)
                .frame(width: UIScreen.main.bounds.width,
                       height:  geometry.frame(in: .global).minY > 0 ? geometry.frame(in: .global).minY + headerHeight : headerHeight)
        case .asyncImage:
            AsyncImage(url: URL(string: imgPath ?? "")) { image in
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
}

// MARK: - Preview
#Preview {
    ImageWithParallax(imageType: .asyncImage,
                      imgPath: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/6.png")
}
