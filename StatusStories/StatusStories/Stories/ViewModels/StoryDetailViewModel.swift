//
//  StoryDetailViewModel.swift
//  StatusStories
//
//  Created by Mohshin on 16/5/20.
//  Copyright © 2020 Status Stories. All rights reserved.
//

import Foundation

protocol StoryDetailViewModelDelegate: AnyObject {
    func didOpenStory(_ story: StoryDetailViewModel)
    func didCloseStory()
}

class StoryDetailViewModel {
        
    weak var delegate: StoryDetailViewModelDelegate?
    
    // MARK: Private Properties
    
    private(set) var posts: [Post]
    private(set) var isOpen = false {
        didSet {
            if isOpen {
                delegate?.didOpenStory(self)
            } else {
                delegate?.didCloseStory()
            }
        }
    }
    
    // MARK: Initializer
    
    init?(posts: [Post], delegate: StoryDetailViewModelDelegate? = nil) {
        guard !posts.isEmpty else {
            return nil
        }
        self.posts = posts
        self.delegate = delegate
    }
    
    // MARK: Public methods
    
    func open() {
        isOpen = true
    }
    
    func close() {
        isOpen = false
    }
}

extension StoryDetailViewModel: Equatable {
    
    static func == (lhs: StoryDetailViewModel, rhs: StoryDetailViewModel) -> Bool {
        lhs.posts == rhs.posts
    }
}
