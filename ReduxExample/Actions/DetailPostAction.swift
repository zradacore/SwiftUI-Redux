//
//  DetailPostAction.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import Foundation



enum DetailPostAction{
    case fetch(id: Int?)
    case fetchComplete(posts: PostElement)
    case fetchError(error: NetworkError)
}
