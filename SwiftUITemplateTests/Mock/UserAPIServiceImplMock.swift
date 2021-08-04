//
//  UserAPIServiceImplMock.swift
//  SwiftUITemplateTests
//
//  Created by Mac on 7/23/21.
//

import Foundation
import Combine
@testable import SwiftUITemplate


class UserAPIServiceImplMock: UserAPIService {

    var response: Response<UserInforModel>?
    var error: APIError?
    
    var apiSession: APISession?
    
    init(apiSession: APISession) {
        self.apiSession = apiSession
    }

    func loginEmail(_ parameter: Parameter) -> AnyPublisher<Response<UserInforModel>, APIError> {
        return Deferred {
            return Future<Response<UserInforModel>, APIError> { promise in
                if let response = self.response {
                    promise(.success(response))
                } else if let error = self.error {
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }


}
