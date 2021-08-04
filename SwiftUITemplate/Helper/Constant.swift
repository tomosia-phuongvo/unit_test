//
//  Constant.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import UIKit

let kUserDefault = UserDefaults.standard
let kMainThread = DispatchQueue.main
let kScreen = UIScreen.main

struct UserDefaultKey {
    static let tutorialIsDisplay = "tutorialIsDisplay"
    static let currentLanguageApp = "currentLanguageApp"
}

struct Constant {
    static let limitRequestAPIRetry = 10
}
