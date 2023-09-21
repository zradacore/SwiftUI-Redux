//
//  PostService.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 20.09.2023.
//

import Foundation
import Combine

public enum NetworkError: Error {
    case invalidURL
    case decodingError
    case noData
}




protocol PostsService{
    var networkRequest: Requestable {get set}
    var enviroment: Environment {get set}
    func getPosts() -> AnyPublisher<Posts, NetworkError>
    func getDetailPost(id: Int?) -> AnyPublisher<PostElement, NetworkError>
}

class PostsServiceIml: PostsService{
    
    var networkRequest: Requestable
    var enviroment: Environment
    
    init(networkRequest: Requestable, enviroment: Environment) {
        self.networkRequest = networkRequest
        self.enviroment = enviroment
    }
    
    func getPosts() -> AnyPublisher<Posts, NetworkError>{
    
        Logger.log("getPosts start")
        let endPoint = PostsNetworkEndpoints.getPosts
        let request = endPoint.createRequest(token: "", environment: enviroment)
        return self.networkRequest.request(request)
    }
    
    
    func getDetailPost(id: Int?) -> AnyPublisher<PostElement, NetworkError> {
        guard let id = id else {return Fail(error: NetworkError.noData).eraseToAnyPublisher()}
        Logger.log("getDetailPost start")
        let endPoint = PostsNetworkEndpoints.getDetailPost(id: id)
        let request = endPoint.createRequest(token: "", environment: enviroment)
        return self.networkRequest.request(request)
        
    }
    
}


