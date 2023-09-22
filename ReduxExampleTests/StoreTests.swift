//
//  ReduxExampleTests.swift
//  ReduxExampleTests
//
//  Created by Владимир Никитин on 22.09.2023.
//

import XCTest


@testable import ReduxExample
final class StoreTests: XCTestCase {
    var mockPosts : Posts!
    var store: AppStore!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        store = AppStore(
            state: .init(posts: .init(), detailPost: .init()),
            reducer: appReducer,
            middlewares: [
                PostMiddleware(service: PostsServiceIml(networkRequest: NativeRequestable(), enviroment: .production)), DetailPostMiddleware(service: PostsServiceIml(networkRequest: NativeRequestable(), enviroment: .production))
        ])
        
        mockPosts = [PostElement(userId: 0, id: 0, title: "Foo", body: "Bar")]
    }

    override func tearDownWithError() throws {
        store = nil
        try super.tearDownWithError()
    }

    func testFetchPostAction(){
        store.dispatch(.post(action: .fetch))
        XCTAssertTrue(store.state.posts.posts.isEmpty)
        XCTAssertTrue(store.state.posts.isFetching)
        XCTAssertNil(store.state.posts.fetchingError)
        
        
    }
    
    
    func testFetchedPostsAction(){
        store.dispatch(.post(action: .fetchComplete(posts: mockPosts)))
        XCTAssertFalse(store.state.posts.posts.isEmpty)
        XCTAssertEqual(store.state.posts.posts, mockPosts)
        XCTAssertNil(store.state.posts.fetchingError)
        XCTAssertFalse(store.state.posts.isFetching)
    }
    
    
    func testFetchedPostsError(){
        let networkError = NetworkError.invalidURL
        store.dispatch(.post(action: .fetchError(error: networkError)))
        XCTAssertFalse(store.state.posts.isFetching)
        XCTAssertEqual(store.state.posts.fetchingError, "Invalid URL, please check it again")
        
    }
    
    
    

 

}


