//
//  Helpers.swift
//  StatusStoriesTests
//
//  Created by Status Stories on 8/5/20.
//  Copyright © 2020 Status Stories. All rights reserved.
//

import Foundation
@testable import StatusStories

// MARK: Helpers

func makeStoryList(with stories: [StoryDetailViewModel] = []) -> StoryListViewModel {
    StoryListViewModel(stories: stories)
}

func makeStory(with posts: [Post], delegate: StoryDetailViewModelDelegate? = nil) -> StoryDetailViewModel {
    guard let storyViewModel = StoryDetailViewModel(posts: posts, delegate: delegate) else {
        fatalError("StoryViewModel can not be created from the provided posts")
    }
    return storyViewModel
}
