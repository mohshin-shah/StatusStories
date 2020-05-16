//
//  StoryViewModelTests.swift
//  StatusStoriesTests
//
//  Created by Mohshin on 16/5/20.
//  Copyright © 2020 Status Stories. All rights reserved.
//

import XCTest
@testable import StatusStories

class StoryViewModelTests: XCTestCase {
    
    func test_story_hasAlwaysPost() {
        let sut = makeSUT(authorName: "", posts: [Post()])
        XCTAssertFalse(sut.story.posts.isEmpty)
    }
        
    func test_story_authorName() {
        let authorName = "Mohshin"
        let sut = makeSUT(authorName: authorName, posts: [Post()])
        XCTAssertEqual(sut.story.authorName, authorName)
    }
                
    private func makeSUT(authorName: String = "", posts: [Post]) -> StoryViewModel {
        StoryViewModel(story: Story(authorName: authorName, posts: posts))
    }
}
