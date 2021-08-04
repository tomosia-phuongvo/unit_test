//
//  FontConvertible.swift
//  SwiftUITemplate
//
//  Created by apple on 28/05/2021.
//

import Foundation
import SwiftUI

extension FontConvertible {
    typealias SwiftUIFont = SwiftUI.Font

    func makeFont(from size: CGFloat) -> SwiftUIFont {
        return SwiftUIFont.custom(name, size: size)
    }
}
