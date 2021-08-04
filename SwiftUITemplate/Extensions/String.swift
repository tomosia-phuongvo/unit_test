//
//  String.swift
//  SwiftUITemplate
//
//  Created by Mac on 7/22/21.
//
import Foundation
import UIKit

struct Regex {
    #if DEBUG
        static let email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    #else
        static let email = "^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$"
    #endif
    static let hiragana = "[ぁ-ゔゞ゛゜ー]+"
    static let katakana = "[ァ-・ヽヾ゛゜ー]+"
    static let numberic = "[0-9]+"
    static let password = "^(?=.*[A-Za-z])(?=.*[0-9])(?!.*[^A-Za-z0-9]).{8,16}$"
    static let symbol = "[:{}()\\[\\]+-.,!@#$%^&*();\\/<>$\\|\"'\\\\_£€$¥•?=~]+"
    static let organizationCode = "[\\d[A-Za-z-]]+"
    static let versionName = "[0-9]+(.[0-9])+.[0-9]"
    static let id = "^[a-zA-Z0-9]*$"
}

extension String {
    static func convert<T>(from value: T?) -> String? where T: LosslessStringConvertible {
        guard let value = value else {
            return nil
        }
        return String(value)
    }

    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = capitalizingFirstLetter()
    }

    // MARK: - handle localized

    // Regex
    func matches(pattern: String, ignoreCase: Bool = false) -> [NSTextCheckingResult]? {
        if let regex = try? NSRegularExpression.init(pattern: pattern, options: .allowCommentsAndWhitespace) {
            let range = NSRange(location: 0, length: count)
            return regex.matches(in: self, options: [], range: range).map { $0 }
        }
        return nil
    }

    func contains(pattern: String, ignoreCase: Bool = false) -> Bool? {
        if let regex = try? NSRegularExpression.init(pattern: pattern, options: .allowCommentsAndWhitespace) {
            let range = NSRange(location: 0, length: count)
            return regex.firstMatch(in: self, options: [], range: range) != nil
        }
        return nil
    }

    func replace(pattern: String, withString replacementString: String, ignoreCase: Bool = false) -> String? {
        if let regex = try? NSRegularExpression.init(pattern: pattern, options: .allowCommentsAndWhitespace) {
            let range = NSRange(location: 0, length: count)
            return regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replacementString)
        }
        return nil
    }

    func validate(regex: String) -> Bool {
        let pre = NSPredicate(format: "SELF MATCHES %@", regex)
        return pre.evaluate(with: self)
    }

    func regex(pattern: String) -> Bool {
        let regexText = NSPredicate(format: "SELF MATCHES %@", pattern)
        return regexText.evaluate(with: self)
    }

    var isEmail: Bool {
        return regex(pattern: Regex.email)
    }

    var isValidPassword: Bool {
        return regex(pattern: Regex.password)
    }

    var isValidId: Bool {
        return regex(pattern: Regex.id)
    }
}
