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
    
    func open(story: StoryViewModel) {
        story.open()
    }
    
    func close(story: StoryViewModel) {
        story.close()
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
    
    func test_open_story_shouldChangeStateToSelected() {
        let post = Post()
        let storyViewModel = makeStory(with: [post])
        let sut = makeStoryList(with: [storyViewModel])
        
        sut.open(story: storyViewModel)
        
        if case let StoryListViewModel.State.selected(selectedStory) = sut.state {
            XCTAssertTrue(selectedStory == storyViewModel)
        } else {
            XCTFail()
        }
    }    
}
