//
//  Helper.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import Foundation
import Localize_Swift

protocol UnknownCase: RawRepresentable, CaseIterable where RawValue: Equatable & Codable {
    static var unknownCase: Self { get }
}

extension UnknownCase {
    init(rawValue: RawValue) {
        let value = Self.allCases.first { $0.rawValue == rawValue }
        self = value ?? Self.unknownCase
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(RawValue.self)
        let value = Self(rawValue: rawValue)
        self = value ?? Self.unknownCase
    }
}

precedencegroup SlashOperatorPrecedence {
    lowerThan: MultiplicationPrecedence
    higherThan: AdditionPrecedence
    associativity: left
    assignment: false
}

infix operator /: SlashOperatorPrecedence

func / (lhs: String, rhs: String) -> String {
    return lhs + "/" + rhs
}

struct Helper {
    static func setTutorialIsDisplay() {
        kUserDefault.tutorialIsDisplay = true
        StoreGroup.appStore.dispatch(action: AppAction.dismissTutorial)
    }

}
