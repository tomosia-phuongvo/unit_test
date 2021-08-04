//
//  Array.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import Foundation

extension Array {
    var description: String {
        var output = "["
        for i in 0 ..< count {
            output += "\n{\n" + String(describing: self[i]) + "\n}\n"
        }
        output += "]"
        return output
    }
}
