//
//  StatusStoriesTests.swift
//  StatusStoriesTests
//
//  Created by Rushi Sangani on 05/05/20.
//  Copyright © 2020 Status Stories. All rights reserved.
//

import XCTest
@testable import StatusStories

struct StoryListViewModel {
    
    private(set) var stories: [StoryViewModel]
    
    init(stories: [StoryViewModel] = []) {
        self.stories = stories
    }
}

class StatusStoriesTests: XCTestCase {
    
    // MARK: - Properties
    
    let sut = StoryListViewModel()
    
    override func setUp() {
        super.setUp()
    }
        
    func test_initialize() {
        let sut = makeStoryList()
        XCTAssertNotNil(sut)
    }
    
    func test_initialize_no_stories() {
        let sut = makeStoryList()
        XCTAssertTrue(sut.stories.isEmpty)
    }
        
    func test_insert_one() {
        let post = Post()
        let story = makeStory(with: [post])
        let sut = makeStoryList(with: [story])
        
        XCTAssertTrue(sut.stories.count == 1)
    }
    
    func test_insert_many() {
        let numberOfStories = 5
        let stories = Array(0..<numberOfStories).map { _ in makeStory(with: [Post()]) }
        let sut = makeStoryList(with: stories)
        
        XCTAssertTrue(sut.stories.count == numberOfStories)
    }
}

