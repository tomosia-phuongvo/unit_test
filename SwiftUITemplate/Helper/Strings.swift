//
//  Strings.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import Foundation
import Localize_Swift

struct Strings {
    struct Button {
        static var btnNext: String { return "btn_next".localized() }
        static var btnOK: String { return "btn_ok".localized() }
    }

    struct Tabbar {
        static var listCat: String { return "tabbar_list_cat".localized() }
    }

    struct TutorialScreen {
        static var title: String { return "tutorial_screen_title".localized() }
        static var languageText: String { return "tutorial_screen_language_text".localized() }
    }

    struct ListCatScreen {
        static var title: String { return "list_cat_screen_title".localized() }
    }
}
