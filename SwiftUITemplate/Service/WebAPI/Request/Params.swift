//
//  Params.swift
//  SwiftUITemplate
//
//  Created by Mac on 7/22/21.
//

import Foundation

typealias Parameter = Codable

struct Request {
    struct Login: Parameter {
        var email: String
        var password: String
        var deviceType: Int
    }
}

