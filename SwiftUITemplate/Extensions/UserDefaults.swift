//
//  UserDefaults.swift
//  SwiftUITemplate
//
//  Created by apple on 26/05/2021.
//

import Foundation

extension UserDefaults {
    func getCurrentLanguageApp() -> Language {
        guard let value = kUserDefault.string(forKey: UserDefaultKey.currentLanguageApp) else {
            return NSLocale.getCurrentLanguage()
        }
        guard let language = Language(rawValue: value) else {
            return NSLocale.getCurrentLanguage()
        }
        return language
    }

    func setCurrentLanguageApp(_ language: Language) {
        kUserDefault.set(language.rawValue, forKey: UserDefaultKey.currentLanguageApp)
    }

    var tutorialIsDisplay: Bool {
        get {
            return kUserDefault.bool(forKey: UserDefaultKey.tutorialIsDisplay)
        } set {
            kUserDefault.setValue(newValue, forKey: UserDefaultKey.tutorialIsDisplay)
        }
    }
}
