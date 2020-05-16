//
//  StoryListViewModel.swift
//  StatusStories
//
//  Created by Status Stories on 16/5/20.
//  Copyright © 2020 Status Stories. All rights reserved.
//

import Foundation

struct Story: Equatable {
    let authorName: String
    let posts: [Post]
}

class StoryViewModel {
    let story: Story
    
    init(story: Story) {
        self.story = story
    }
}

extension StoryViewModel: Equatable, Hashable {
    static func == (lhs: StoryViewModel, rhs: StoryViewModel) -> Bool {
        lhs.story == rhs.story
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(story.authorName)
    }
}

class StoryListViewModel {
        
    private(set) var stories: [StoryViewModel]
    
    init(stories: [StoryViewModel] = []) {
        self.stories = stories
    }
    
    func add(_ story: StoryViewModel) {
        stories.append(story)
    }
    
    func add(_ newStories: [StoryViewModel]) {
        stories.append(contentsOf: newStories)
    }
}

