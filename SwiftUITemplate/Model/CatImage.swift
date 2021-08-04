//
//  CatImage.swift
//  SwiftUITemplate
//
//  Created by apple on 26/05/2021.
//

import Foundation

struct CatImage: Codable, Equatable {
    let id: String?
    let url: String?
    let width: Int?
    let height: Int?
    let categories: [CatCategory]?

    static func == (lhs: CatImage, rhs: CatImage) -> Bool {
        guard let lhsId = lhs.id, let rhsId = rhs.id else {
            return false
        }
        return lhsId == rhsId
    }
}
