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

class StoryViewModel: Equatable {
    
    private(set) var posts: [Post]
    private(set) var isOpen = false
    private(set) var listStateListener: ListStateListener?
    
    init?(posts: [Post], listStateListener: ListStateListener? = nil) {
        guard !posts.isEmpty else {
            return nil
        }
        self.posts = posts
        self.listStateListener = listStateListener
    }
    
    func setSelected(_ isSelected: Bool) {
        isOpen = isSelected
        
        let state: StoryListViewModel.State = isOpen ? .selected(self) : .list
        listStateListener?.updateListState(to: state)
    }
    
    static func == (lhs: StoryViewModel, rhs: StoryViewModel) -> Bool {
        lhs.posts == rhs.posts
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
