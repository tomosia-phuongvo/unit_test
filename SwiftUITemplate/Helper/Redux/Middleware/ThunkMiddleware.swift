//
//  ThunkMiddleware.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import Foundation

typealias AsyncActionCreator = (@escaping GetState, @escaping DispatchFunction) -> Any
typealias ActionCreator = (@escaping GetState, @escaping DispatchFunction) -> Void

struct AsyncActionWrapper: Action {
    let action: AsyncActionCreator
}

struct ActionWrapper: Action {
    let action: ActionCreator
}

extension Store {
    @discardableResult
    func dispatch(_ action: @escaping AsyncActionCreator) -> Any {
        return dispatch(action: AsyncActionWrapper(action: action))
    }

    func dispatch(_ action: @escaping ActionCreator) {
        _ = dispatch(action: ActionWrapper(action: action))
    }
}

struct ThunkMiddleware: Middleware {
    func proccess(getState: @escaping GetState, dispatch: @escaping DispatchFunction) -> (@escaping DispatchFunction) -> DispatchFunction {
        return { next in
            { action in
                if let actionWrapper = action as? AsyncActionWrapper {
                    return actionWrapper.action(getState, dispatch)
                } else if let actionWrapper = action as? ActionWrapper {
                    return actionWrapper.action(getState, dispatch)
                }
                return next(action)
            }
        }
    }
}
