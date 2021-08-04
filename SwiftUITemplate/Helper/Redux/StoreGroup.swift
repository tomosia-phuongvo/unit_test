//
//  StoreGroup.swift
//  SwiftUITemplate
//
//  Created by apple on 26/05/2021.
//

import Foundation

struct StoreGroup {
    static let appStore = AppStore(reducer: AppReducer(), state: AppReducer.initialState() as! AppState, middleware: ThunkMiddleware())
}
