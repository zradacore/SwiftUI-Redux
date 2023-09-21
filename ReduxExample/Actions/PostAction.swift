//
//  PostAction.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 20.09.2023.
//

import Foundation





enum PostAction{
    case fetch
    case fetchComplete(posts: Posts)
    case fetchError(error: NetworkError)
}



