//
//  StoryListViewModel.swift
//  StatusStories
//
//  Created by Status Stories on 16/5/20.
//  Copyright © 2020 Status Stories. All rights reserved.
//

import Foundation

class StoryListViewModel {
    
    enum State: Equatable {
        case list
        case selected(StoryDetailViewModel)
    }
    
    private(set) var stories: [StoryDetailViewModel]
    var state: State
    
    init(stories: [StoryDetailViewModel] = []) {
        self.stories = stories
        self.state = .list
    }
}

// MARK: StoryDetailViewModelDelegate methods

extension StoryListViewModel: StoryDetailViewModelDelegate {
    
    func didOpenStory(_ story: StoryDetailViewModel) {
        state = .selected(story)
    }
    
    func didCloseStory() {
        state = .list
    }
}
