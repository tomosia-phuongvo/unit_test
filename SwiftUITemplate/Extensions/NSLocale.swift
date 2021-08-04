//
//  NSLocale.swift
//  SwiftUITemplate
//
//  Created by apple on 26/05/2021.
//

import Foundation

extension NSLocale {
    static func getCurrentLanguage() -> Language {
        if preferredLanguages.first?.lowercased().hasPrefix(Language.vi.rawValue.lowercased()) == true {
            return .vi
        } else {
            return .en
        }
    }
}
