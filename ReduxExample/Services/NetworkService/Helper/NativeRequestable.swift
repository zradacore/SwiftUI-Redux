//
//  NativeRequestable.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import Foundation
import Combine

public class NativeRequestable: Requestable {
    public var requestTimeOut: Float = 30
    
    public func request<T>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
    where T: Decodable, T: Encodable {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = TimeInterval(req.requestTimeOut ?? requestTimeOut)
        
        guard let url = URL(string: req.url) else {
            // Return a fail publisher if the url is invalid
            return AnyPublisher(
                Fail<T, NetworkError>(error: NetworkError.invalidURL)
            )
        }
        // We use the dataTaskPublisher from the URLSession which gives us a publisher to play around with.
        return URLSession.shared
            .dataTaskPublisher(for: req.buildURLRequest(with: url))
            .timeout(30, scheduler: DispatchQueue.main)
            .tryMap { output in
                Logger.log("getting data \(String(data: output.data ?? Data(), encoding: .utf8))")
                guard output.response is HTTPURLResponse else {
                    throw NetworkError.noData
                }
                return output.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                
                return NetworkError.decodingError
              
            }
            .eraseToAnyPublisher()
    }
}
