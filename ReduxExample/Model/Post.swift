//
//  Post.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 20.09.2023.
//

import Foundation

typealias Posts = [PostElement]

struct PostElement: Codable, Hashable {
    let userId, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userId = "userId"
        case id, title, body
    }
    
}


//MARK: Supported Mock
extension PostElement{
    static let mock = PostElement(userId: .none, id: .none, title: .none, body: .none)
}


