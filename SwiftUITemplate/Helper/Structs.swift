//
//  Structs.swift
//  SwiftUITemplate
//
//  Created by apple on 28/05/2021.
//

import Foundation

struct MsgAlertContent: Identifiable {
    var id: String = UUID().uuidString
    let title: String
    let message: String
}
