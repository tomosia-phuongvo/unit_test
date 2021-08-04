//
//  Screen.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import Combine
import Foundation
import SwiftUI

protocol ScreenProtocol: View {
    associatedtype ViewModel: ViewModelProtocol

    var viewModel: ViewModel { get }
}
