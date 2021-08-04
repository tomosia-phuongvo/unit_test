//
//  UserAPIService.swift
//  SwiftUITemplate
//
//  Created by Mac on 7/22/21.
//

import Foundation
import Combine


protocol UserAPIService {
    func loginEmail(_ parameter: Parameter) -> AnyPublisher<Response<UserInforModel>, APIError>
}
