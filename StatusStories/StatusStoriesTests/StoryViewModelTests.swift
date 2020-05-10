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

protocol StoryViewModelDelegate {
    func storyDidOpen()
    func storyDidClose()
}

class StoryViewModel: Equatable {
    
    private(set) var posts: [Post]
    
    private(set) var isOpen = false {
        didSet {
            if isOpen {
                delegate?.storyDidOpen()
            } else {
                delegate?.storyDidClose()
            }
        }
    }
    
    var delegate: StoryViewModelDelegate?
    
    init?(posts: [Post], delegate: StoryViewModelDelegate? = nil) {
        guard !posts.isEmpty else {
            return nil
        }
        self.posts = posts
        self.delegate = delegate
    }
    
    func open() {
        isOpen = true
    }
    
    func close() {
        isOpen = false
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
    
    func test_story_open() {
        let post = Post()
        let storyViewModel = makeStory(with: [post])
        storyViewModel.open()
        XCTAssertTrue(storyViewModel.isOpen)
    }
    
    func test_story_close() {
        let post = Post()
        let storyViewModel = makeStory(with: [post])
        storyViewModel.close()
        XCTAssertFalse(storyViewModel.isOpen)
    }
}
