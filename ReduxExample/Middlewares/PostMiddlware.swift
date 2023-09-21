//
//  PostMiddleare.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import Foundation
import Combine



typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>?
func PostMiddleware(service: PostsService) -> Middleware<AppState, AppAction>{
    return{ state, action in
        switch(action){
        case .post(action: .fetch):
            return service.getPosts()
                .subscribe(on: DispatchQueue.main)
                .map{AppAction.post(action: .fetchComplete(posts: $0))}
                .catch { (error: NetworkError) -> Just<AppAction> in
                    switch error{
                    case .invalidURL:
                        return Just(AppAction.post(action: .fetchError(error: .invalidURL)))
                    case .decodingError:
                         return Just(AppAction.post(action: .fetchError(error: .decodingError)))
                    case .noData:
                         return Just(AppAction.post(action: .fetchError(error: .noData)))
                    }
                    
                }
                .eraseToAnyPublisher()
        default: break
        }
        return Empty().eraseToAnyPublisher()
    }
}
