//
//  PostReducer.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 20.09.2023.
//

import Foundation


/// reducer(state, action)
func postRecuder(state: inout PostState, action: PostAction) -> Void{
    switch action{
        
    case .fetch:
        state.fetchingError = nil
        state.isFetching = true
    case .fetchComplete(let posts):
        state.fetchingError = nil
        state.isFetching = false
        state.posts = posts
    case .fetchError(let error):
        state.isFetching = false
        switch error {
        case .invalidURL: state.fetchingError = "Invalid URL, please check it again"
        default: state.fetchingError = "Something went wrong"
        }
    }
}
