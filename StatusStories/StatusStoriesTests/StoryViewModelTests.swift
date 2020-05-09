//
//  StoryViewModel.swift
//  StatusStoriesTests
//
//  Created by Mohshin on 8/5/20.
//  Copyright © 2020 Status Stories. All rights reserved.
//

import XCTest

struct Post: Equatable {
    var text: String = ""
}

class StoryViewModel: NSObject {
    
    private(set) var posts: [Post]
    private(set) var isOpen = false
    
    init?(posts: [Post]) {
        guard !posts.isEmpty else {
            return nil
        }
        self.posts = posts
    }
    
    func setSelected(_ isSelected: Bool) {
        isOpen = isSelected
    }
}

class StoryViewModelTests: XCTestCase {
    
    func test_story_hasAtleastOnePost() {
        let sut = StoryViewModel(posts: [])
        XCTAssertNil(sut)
    }

    func test_story_posts() {
        let numberOfPosts = 5
        let posts = Array(0..<numberOfPosts).map { _ in Post() }
        let sut = makeStory(with: posts)
        XCTAssertTrue(sut.posts.count == numberOfPosts)
    }
}
