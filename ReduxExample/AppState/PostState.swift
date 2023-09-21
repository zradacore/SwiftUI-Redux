//
//  PostState.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 20.09.2023.
//

import Foundation


struct PostState{
    var posts : Posts = Posts()
    var isFetching = false
    var fetchingError : String?
}
