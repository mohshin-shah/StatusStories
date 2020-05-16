//
//  StoryListViewModelTests.swift
//  StoryListViewModelTests
//
//  Copyright © 2020 Status Stories. All rights reserved.
//

import XCTest
@testable import StatusStories

class StoryListViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    lazy var stories: [StoryViewModel] = {
        [
            StoryViewModel(story: Story(authorName: "User1", posts: [Post()])),
            StoryViewModel(story: Story(authorName: "User2", posts: [Post()])),
            StoryViewModel(story: Story(authorName: "User3", posts: [Post()])),
            StoryViewModel(story: Story(authorName: "User4", posts: [Post()])),
            StoryViewModel(story: Story(authorName: "User5", posts: [Post()])),
        ]
    }()
    
    override func setUp() {
        super.setUp()
    }
            
    func test_initialize_list_withStories() {
        let sut = StoryListViewModel(stories: stories)
        XCTAssertTrue(sut.stories.count == stories.count)
    }
    
    func test_append_to_storyList() {
        let story6 = StoryViewModel(story: Story(authorName: "User6", posts: [Post()]))
        let story7 = StoryViewModel(story: Story(authorName: "User7", posts: [Post()]))
        
        let sut = StoryListViewModel()
        sut.add(story6)
        sut.add(story7)
        
        XCTAssertTrue(sut.stories.count == 2)
    }
    

    func test_append_to_storyList_many() {
        let story6 = StoryViewModel(story: Story(authorName: "User6", posts: [Post()]))
        let story7 = StoryViewModel(story: Story(authorName: "User7", posts: [Post()]))
        
        let sut = StoryListViewModel()
        sut.add([story6, story7])
        
        XCTAssertTrue(sut.stories.count == 2)
    }
    
    func test_storyList_hasCorrectSequence() {
        let sut = StoryListViewModel(stories: stories)
        XCTAssertEqual(sut.stories[0], stories[0])
        XCTAssertEqual(sut.stories[1], stories[1])
        XCTAssertNotEqual(sut.stories[0], stories[1])
    }
}


//    func test_initial_state() {
//        let sut = makeStoryList()
//        XCTAssertTrue(sut.state == .list)
//    }
    
//    func test_open_story_shouldChangeStateToSelected() {
//        let post = Post()
//        let storyDetailViewModel = makeStoryDetailViewModel()
//        let sut = makeStoryList(with: [storyViewModel])
//
//        storyViewModel.delegate = sut
//
//        storyViewModel.open()
//
//        if case let StoryListViewModel.State.selected(selectedStory) = sut.state {
//            XCTAssertTrue(selectedStory == storyViewModel)
//        } else {
//            XCTFail()
//        }
//    }
    
//    func test_close_story_shouldChangeStateToList() {
//        let post = Post()
//        let storyViewModel = makeStoryDetailViewModel(with: [post])
//        let sut = makeStoryList(with: [storyViewModel])
//
//        storyViewModel.delegate = sut
//
//        storyViewModel.close()
//
//        XCTAssertTrue(sut.state == .list)
//    }
