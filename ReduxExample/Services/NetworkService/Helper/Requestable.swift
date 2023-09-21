//
//  Requestable.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import Foundation
import Combine

public protocol Requestable{
    var requestTimeOut : Float {get}
    
    
    func request<T: Codable>(_ req: NetworkRequest) -> AnyPublisher<T, NetworkError>
}
