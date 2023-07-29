//
//  Endpoints.swift
//  iOS-Viper-Study
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/21.
//

import Foundation

struct API {
    // This base url comes from MockNode. You need to run `npm i && npm start`.
    // Then you can see a address, please keep variable `baseUrl` is same as the console address.
    static let baseUrl = "http://192.168.0.102:8001"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Posts: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/getAllPosts"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}
