//
//  ApplicationFactory.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import Foundation





protocol AppEnvironment{
    var postsNetworkService : PostsService! {get}
    var store: AppStore! {get}
}


class AppEnvironmentImp: AppEnvironment, ObservableObject{
    
    
    @Published private(set) var postsNetworkService: PostsService!
    
    @Published private(set) var store: AppStore!
    
    
    
    init() {
        self.postsNetworkService = PostsServiceIml(networkRequest: NativeRequestable(), enviroment: .production)
        
        self.store = AppStore(state: .init(posts: PostState()),
                         reducer: appReducer,
                         middlewares: [
                            PostMiddleware(service: postsNetworkService)
                         ])
        
    }
}
