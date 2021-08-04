//
//  AppAction.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import Foundation

enum AppAction: Action {
    case dismissTutorial
    case changeLanguage(Language)
    case changeNetworkConnectStatus(NetworkConnectStatus)
}
