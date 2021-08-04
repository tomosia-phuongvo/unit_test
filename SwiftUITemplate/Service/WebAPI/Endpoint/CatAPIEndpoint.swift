//
//  CatEndpoint.swift
//  SwiftUITemplate
//
//  Created by apple on 26/05/2021.
//

import Alamofire
import Foundation

enum CatAPIEndpoint {
    static let endpoint = "https://api.thecatapi.com"
    static let apiKey = "c19e8a04-328e-4aa6-9bf6-82f25acdba7a"

    enum Version: String {
        case v1

        var path: String {
            return endpoint / Version.v1.rawValue
        }
    }

    // MARK: - Public Image

    case getPublicImage(param: FetchPublicImageParam)
}

extension CatAPIEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        // Public Image
        case let .getPublicImage(param: param):
            let url = URL(string: Version.v1.path / "images/search")!
            let request = createURLRequest(url: url, method: .get, parameters: param.dictionary)
            return request
        }
    }
}

extension CatAPIEndpoint {
    struct FetchPublicImageParam: Codable {
        let size: ImageSize
        var limit: Int = 20
        let page: Int
        let order: Order

        enum ImageSize: String, Codable {
            case full, med, small, thumb
        }

        enum Order: String, Codable {
            case random = "RANDOM"
            case asc = "ASC"
            case desc = "DESC"
        }
    }
}


enum APIEndpoint {
    static let endpoint = "http://18.181.14.181"
    
    case login(param: Parameter)
    
    var path: String {
        switch self {
        case .login: return APIEndpoint.endpoint / "auth/v2/login/"
        }
    }
}

extension APIEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case let .login(param):
            let request = createURLRequest(url: try! path.asURL(), method: .post, parameters: param.dictionary)
            return request
        }
    }
}
