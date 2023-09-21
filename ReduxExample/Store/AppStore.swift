//
//  AppStore.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import Foundation
import Combine





typealias AppStore = Store<AppState, AppAction>

final class Store<State, Action>: ObservableObject {
    @Published private(set) var state : State
    
    let middlewares: [Middleware<State, Action>]
    let reducer : Reducer<State, Action>
    private var middlewareCanceblles: Set<AnyCancellable> = []
    
    init(
        state: State,
        reducer: @escaping Reducer<State, Action>,
        middlewares: [Middleware<State, Action>]
    ){
        self.state = state
        self.reducer = reducer
        self.middlewares = middlewares
    }
    
    
    func dispatch(_ action: Action){
        reducer(&state, action)
        
        for middleware in middlewares {
            guard let middleware = middleware(state, action) else { break }
            middleware
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: dispatch)
                .store(in: &middlewareCanceblles)
                
        }
    }
    
}
