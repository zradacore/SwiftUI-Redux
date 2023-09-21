//
//  AppAction.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 20.09.2023.
//

import Foundation


enum AppAction {
    case post(action: PostAction)
    case detailPost(action: DetailPostAction)
}
