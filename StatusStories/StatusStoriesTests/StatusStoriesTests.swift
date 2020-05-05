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

struct StoryViewModel {
    
}

class StatusStoriesTests: XCTestCase {
    
    // MARK: - Properties
    
    let sut = StoryListViewModel()
    
    override func setUp() {
        super.setUp()
    }
        
    func test_initialize() {
        let sut = makeSUT()
        XCTAssertNotNil(sut)
    }
    
    func test_initialize_no_stories() {
        let sut = makeSUT()
        XCTAssertTrue(sut.stories.isEmpty)
    }
    
    func test_insert_one() {
        let story = StoryViewModel()
        let sut = makeSUT(with: [story])
        
        XCTAssertTrue(sut.stories.count == 1)
    }
    
    
    private func makeSUT(with stories: [StoryViewModel] = []) -> StoryListViewModel {
        StoryListViewModel(stories: stories)
    }
}

