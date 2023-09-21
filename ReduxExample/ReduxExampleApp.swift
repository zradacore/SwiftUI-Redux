//
//  ReduxExampleApp.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 20.09.2023.
//

import SwiftUI

@main
struct ReduxExampleApp: App {
    
  
    
    let store = AppStore(
        state: .init(posts: .init(), detailPost: .init()),
        reducer: appReducer,
        middlewares: [
            PostMiddleware(service: PostsServiceIml(networkRequest: NativeRequestable(), enviroment: .production)), DetailPostMiddleware(service: PostsServiceIml(networkRequest: NativeRequestable(), enviroment: .production))
    ])
    
    
    
    var body: some Scene {
        WindowGroup {
            PostsListScreen().environmentObject(store)
        }
    }
}
