//
//  DetailPostState.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import Foundation


struct DetailPostState{
    var detailPost : PostElement = .init(userId: nil, id: nil, title: nil, body: nil)
    var isFetching = false
    var fetchingError : String?
}
