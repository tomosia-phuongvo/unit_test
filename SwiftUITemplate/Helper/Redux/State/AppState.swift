//
//  AppState.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import Foundation

struct AppState: ReduxState {
    var tutorialIsDisplay: Bool
    var language: Language
    var networkConnectStatus: NetworkConnectStatus
}
