//
//  ReduxProtocol.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import Foundation

protocol Action {}

protocol ReduxState {}

protocol Reducer {
    static func initialState() -> ReduxState
    func handlerAction(state: ReduxState, action: Action) -> ReduxState
}

protocol Middleware {
    func proccess(getState: @escaping GetState, dispatch: @escaping DispatchFunction) -> (@escaping DispatchFunction) -> DispatchFunction
}

protocol Store: ObservableObject {
    associatedtype State: ReduxState

    var reducer: Reducer { get }
    // When conform need declare is @Published
    var state: State { get set }
    var middleware: Middleware { get set }

    init(reducer: Reducer, state: State, middleware: Middleware)

    func dispatch(action: Action) -> Any
    func getState() -> State?
}

extension Store {
    @discardableResult
    func dispatch(action: Action) -> Any {
        let getState: GetState = { [unowned self] in
            self.getState()
        }
        let dispatch: DispatchFunction = { [unowned self] in
            self.dispatch(action: $0)
        }
        let dispatchCore: DispatchFunction = { [unowned self] in
            self.dispatchCore(action: $0)
        }
        return middleware.proccess(getState: getState, dispatch: dispatch)(dispatchCore)(action)
    }

    func getState() -> State? {
        return state
    }

    fileprivate func dispatchCore(action: Action) {
        state = reducer.handlerAction(state: state, action: action) as! Self.State
    }
}

typealias GetState = () -> ReduxState?
typealias DispatchFunction = (Action) -> Any
