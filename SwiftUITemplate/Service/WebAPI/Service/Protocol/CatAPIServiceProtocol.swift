//
//  CatServiceProtocol.swift
//  SwiftUITemplate
//
//  Created by apple on 26/05/2021.
//

import Combine
import Foundation

protocol CatAPIServiceProtocol {
    func fetchPublicImage(param: CatAPIEndpoint.FetchPublicImageParam) -> AnyPublisher<[CatImage], APIError>
}
