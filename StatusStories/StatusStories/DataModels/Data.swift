//
//  Data.swift
//  StatusStories
//
//  Created by Mohshin on 16/5/20.
//  Copyright © 2020 Status Stories. All rights reserved.
//

import Foundation

let storiesData = makeStories()

func makeStories() -> [StoryViewModel] {
    [
        StoryViewModel(story: Story(authorName: "User1", posts: [Post(), Post(), Post()])),
        StoryViewModel(story: Story(authorName: "User2", posts: [Post()])),
        StoryViewModel(story: Story(authorName: "User3", posts: [Post()])),
        StoryViewModel(story: Story(authorName: "User4", posts: [Post(), Post()])),
        StoryViewModel(story: Story(authorName: "User5", posts: [Post()])),
    ]
}
