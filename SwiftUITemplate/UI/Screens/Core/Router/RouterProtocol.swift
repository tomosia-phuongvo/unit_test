//
//  Router.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//
import Combine
import SwiftUI

protocol RouterProtocol: ObservableObject {
    associatedtype Screen = ScreenProtocol

    var screen: Screen { get }
}

extension RouterProtocol {
    func animation(_ animation: Animation? = nil, _ handle: @escaping () -> Void) {
        withAnimation(animation) {
            handle()
        }
    }
}
