//
//  File.swift
//  SwiftUITemplate
//
//  Created by Mac on 7/22/21.
//

import Foundation

struct Response<T: Codable>: Codable {
    var errorCode: Int
    var data: T?
    var message: String?
}
