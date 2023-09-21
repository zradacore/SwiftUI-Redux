//
//  Routing.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import Foundation







public typealias Headers = [String: String]

enum PostsNetworkEndpoints {
    case getPosts
    case getDetailPost(id: Int)
    

    
    
    var httpMethod : HTTPMethod{
        switch self{
        case .getPosts, .getDetailPost: return .GET
        }
    }
    
    func createRequest(token: String, environment: Environment) -> NetworkRequest {
        var headers: Headers = [:]
        headers["Content-Type"] = "application/json"
        headers["Accept"] = "application/json"
        
        headers["Authorization"] = "Bearer \(token)"
        print(headers)
        return NetworkRequest(url: getURL(from: environment), headers: headers, body: requestBody, httpMethod: httpMethod)
    }
    
    func getURL(from environment: Environment) -> String {
        let baseUrl = environment.baseServiceURL
        switch self {
       
        case .getPosts: return baseUrl + "posts"
        case .getDetailPost(let id): return baseUrl + "posts/\(id)"
        }
    }
    
    var requestBody: Encodable? {
        switch self {
            
        default:
            return nil
        }
    }
}
