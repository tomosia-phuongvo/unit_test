//
//  ViewModel.swift
//  SwiftUITemplate
//
//  Created by apple on 25/05/2021.
//

import Combine
import Foundation

protocol ViewModelProtocol: ObservableObject {
    associatedtype Router = RouterProtocol

    // When conform need declare is unowned
    var router: Router! { get set }
}
