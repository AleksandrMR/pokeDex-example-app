//
//  CKListItem1.swift
//
//
//  Created by Aleksandr Milashevski on 25/07/24.
//

import SwiftUI
import AssetKit

public struct CKListItem1: View {
    
    public enum ImageType {
        case image
        case asyncImage
    }
    
    // MARK: - Let
    private let imageType: ImageType
    private let title: String
    private let image: UIImage?
    private let imgPath: String?
    private let action: ()->()
    
    // MARK: - Initialization func
    public init(imageType: ImageType,
                title: String,
                image: UIImage? = nil,
                imgPath: String? = nil,
                action: @escaping () -> Void) {
        self.imageType = imageType
        self.title = title
        self.image = image
        self.imgPath = imgPath
        self.action = action
    }
    
    // MARK: - Body
    public var body: some View {
        Button {
            action()
        } label: {
            itemLabel
        }
    }
}

// MARK: - Extensions
private extension CKListItem1 {
    @ViewBuilder var itemLabel: some View {
        HStack {
            itemImage
            Spacer()
            Text(title.uppercased())
                .font(AKFonts.pokemonClassic(16).font)
                .foregroundColor(AKColors.blue3b4cca.color)
        }
        .background(AKColors.yellowffde00.color)
    }
    
    @ViewBuilder var itemImage: some View {
        switch imageType {
        case .image:
            if let uiImg = image {
                Image(uiImage: uiImg)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
            } else {
               PokImgPlaceholder()
            }
            
        case .asyncImage:
            AsyncImage(url: URL(string: imgPath ?? "")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100, alignment: .center)
        }
    }
}

// MARK: - Preview
#Preview {
    CKListItem1(imageType: .asyncImage,
                title: "Title",
                imgPath: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/6.png") { }
}
