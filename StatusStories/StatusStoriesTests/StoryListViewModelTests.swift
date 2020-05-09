//
//  StatusStoriesTests.swift
//  StatusStoriesTests
//
//  Created by Rushi Sangani on 05/05/20.
//  Copyright © 2020 Status Stories. All rights reserved.
//

import XCTest
@testable import StatusStories

class StoryListViewModel {
    
    enum State: Equatable {
        case list
        case selected(StoryViewModel)
    }
    
    private(set) var stories: [StoryViewModel]
    var state: State
    
    init(stories: [StoryViewModel] = []) {
        self.stories = stories
        self.state = .list
    }
    
    func select(_ story: StoryViewModel) {
        self.state = .selected(story)
        story.setSelected(true)
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
    
    func test_initial_state() {
        let sut = makeStoryList()
        XCTAssertTrue(sut.state == .list)
    }
    
    func test_select_story() {
        let post = Post()
        let storyViewModel = makeStory(with: [post])
        let sut = makeStoryList(with: [storyViewModel])
        
        sut.select(storyViewModel)
        
        if case let StoryListViewModel.State.selected(selectedStory) = sut.state {
            XCTAssertTrue(selectedStory == storyViewModel)
        } else {
            XCTFail()
        }
    }
    
    func test_select_story_should_open() {
        let post = Post()
        let storyViewModel = makeStory(with: [post])
        let sut = makeStoryList(with: [storyViewModel])
        
        sut.select(storyViewModel)
        XCTAssertTrue(storyViewModel.isOpen)
    }
}

