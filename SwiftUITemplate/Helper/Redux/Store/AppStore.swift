//
//  AppStore.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import Combine
import Foundation

class AppStore: Store {
    typealias State = AppState

    var reducer: Reducer
    @Published var state: AppState
    var middleware: Middleware

    required init(reducer: Reducer, state: AppState, middleware: Middleware) {
        self.reducer = reducer
        self.state = state
        self.middleware = middleware
    }
}
