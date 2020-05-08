//
//  Helpers.swift
//  StatusStoriesTests
//
//  Created by Mohshin on 8/5/20.
//  Copyright © 2020 Status Stories. All rights reserved.
//

import Foundation

//MARK: Helpers
func makeStoryList(with stories: [StoryViewModel] = []) -> StoryListViewModel {
    StoryListViewModel(stories: stories)
}

func makeStory(with posts: [Post]) -> StoryViewModel {
    return StoryViewModel(posts: posts)
}
