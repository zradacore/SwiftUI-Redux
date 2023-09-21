//
//  AppReducer.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 20.09.2023.
//

import Foundation



typealias Reducer<State, Action> = (inout State, Action) -> Void
func appReducer(state: inout AppState, action: AppAction) -> Void{
    switch action{
    case .post(let postAction):
        postRecuder(state: &state.posts, action: postAction)
        break
    case .detailPost(action: let detailPostAction):
        detailPostReducer(state: &state.detailPost, action: detailPostAction)
    default: print("Def")
    }
}
