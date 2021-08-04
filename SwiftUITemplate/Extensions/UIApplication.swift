//
//  UIApplication.swift
//  SwiftUITemplate
//
//  Created by apple on 27/05/2021.
//

import UIKit

extension UIApplication {
    static var statusBarHeight: CGFloat {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return 0
        }
        return windowScene.statusBarManager?.statusBarFrame.height ?? 0
    }
}
