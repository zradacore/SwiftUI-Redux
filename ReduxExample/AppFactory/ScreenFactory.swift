//
//  ScreenFactory.swift
//  ReduxExample
//
//  Created by Владимир Никитин on 21.09.2023.
//

import Foundation
import SwiftUI



protocol ScreenFactory{
    
    
    func makePostsScreen() -> PostsListView
}


final class ScreenFactoryImp: ScreenFactory{
    
    

    
    
    func makePostsScreen() -> PostsListView {
      return PostsListView()
    }
    
    
  
       
    
}
