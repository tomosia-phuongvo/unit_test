//
//  AppReducer.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import Foundation

struct AppReducer: Reducer {
    static func initialState() -> ReduxState {
        return AppState(tutorialIsDisplay: kUserDefault.tutorialIsDisplay,
                        language: kUserDefault.getCurrentLanguageApp(),
                        networkConnectStatus: .notConnect)
    }

    func handlerAction(state: ReduxState, action: Action) -> ReduxState {
        guard var newState = state as? AppState,
              let action = action as? AppAction else {
            return state
        }
        switch action {
        case .dismissTutorial:
            newState.tutorialIsDisplay = true
        case let .changeLanguage(language):
            newState.language = language
        case let .changeNetworkConnectStatus(status):
            newState.networkConnectStatus = status
        }
        return newState
    }
}
