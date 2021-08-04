//
//  HTTPURLResponse.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import UIKit

extension HTTPURLResponse {
    enum Status {
        case success
        case failed
    }

    var status: Status {
        if (200 ... 299).contains(statusCode) {
            return .success
        } else {
            return .failed
        }
    }
}
