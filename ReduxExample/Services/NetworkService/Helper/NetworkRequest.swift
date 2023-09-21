//
//  NetworkRequest.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import Foundation


public struct NetworkRequest{
    let url: String
    let headers: [String: String]?
    let body: Data?
    let requestTimeOut : Float?
    let httpMethod : HTTPMethod
    
    public init(url: String, headers: [String : String]? = nil, body: Data? = nil, requestTimeOut: Float? = nil, httpMethod: HTTPMethod) {
        self.url = url
        self.headers = headers
        self.body = body
        self.requestTimeOut = requestTimeOut
        self.httpMethod = httpMethod
    }
    
    public init(url: String, headers: [String : String]? = nil, body: Encodable? = nil, requestTimeOut: Float? = nil, httpMethod: HTTPMethod) {
        self.url = url
        self.headers = headers
        self.body = body?.encode()
        self.requestTimeOut = requestTimeOut
        self.httpMethod = httpMethod
    }
    
    func buildURLRequest(with url: URL) -> URLRequest{
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = headers ?? [:]
        urlRequest.httpBody = body
        return urlRequest
    }
}



extension Encodable {
    func encode() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            return nil
        }
    }
}

public enum HTTPMethod: String{
    case GET
    case POST
    case PUT
    case DELETE
}

