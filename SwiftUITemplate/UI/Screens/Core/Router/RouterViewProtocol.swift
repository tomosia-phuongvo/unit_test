//
//  RouterView.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import Foundation
import SwiftUI

protocol RouterViewProtocol: View {
    associatedtype Router: RouterProtocol

    // When conform need declare @StateObject
    var router: Router { get }
}
