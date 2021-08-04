//
//  UserAPIServiceImpl.swift
//  SwiftUITemplate
//
//  Created by Mac on 7/22/21.
//

import Foundation
import Combine

struct UserAPIServiceImpl: UserAPIService {
    let apiSession: APIService
    
    func loginEmail(_ parameter: Parameter) -> AnyPublisher<Response<UserInforModel>, APIError> {
        let requestBuilder = APIEndpoint.login(param: parameter)
        return apiSession.request(with: requestBuilder, decoder: nil)
    }
}
