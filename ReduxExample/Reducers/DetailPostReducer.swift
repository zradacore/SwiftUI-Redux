//
//  DetailPostReducer.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import Foundation



func detailPostReducer(state: inout DetailPostState, action: DetailPostAction){
    switch action {
    case .fetch:
        state.detailPost = .init(userId: nil, id: nil, title: nil, body: nil)
        state.fetchingError = nil
        state.isFetching = true
    case .fetchComplete(let detailPost):
        state.detailPost = detailPost
        state.isFetching = false
        state.fetchingError = nil
    case .fetchError(let error):
        state.isFetching = false
        switch error {
        case .invalidURL: state.fetchingError = "Invalid URL, please check it again"
        default: state.fetchingError = "Something went wrong"
        }
    }
}
