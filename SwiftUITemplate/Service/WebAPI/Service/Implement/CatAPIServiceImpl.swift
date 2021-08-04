//
//  CatServiceImpl.swift
//  SwiftUITemplate
//
//  Created by apple on 26/05/2021.
//

import Combine
import Foundation

struct CatAPIServiceImpl: CatAPIServiceProtocol {
    let apiSession: APIService

    func fetchPublicImage(param: CatAPIEndpoint.FetchPublicImageParam) -> AnyPublisher<[CatImage], APIError> {
        let requestBuilder = CatAPIEndpoint.getPublicImage(param: param)
        return apiSession.request(with: requestBuilder, decoder: nil)
    }
}
