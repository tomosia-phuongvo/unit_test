//
//  NetworkImageView.swift
//  SwiftUITemplate
//
//  Created by apple on 26/05/2021.
//

import SDWebImageSwiftUI
import SwiftUI

struct NetworkImageView: View {
    let url: URL?
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat

    @ViewBuilder
    var body: some View {
        ZStack {
            if url.isNil {
                Image(uiImage: Asset.imgPlaceholder.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            } else {
                WebImage(url: url!)
                    .resizable()
                    .placeholder(Image(uiImage: Asset.imgPlaceholder.image))
                    .transition(.fade(duration: 0.25))
                    .scaledToFill()
                    .frame(width: width, height: height)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            }
        }
    }
}
