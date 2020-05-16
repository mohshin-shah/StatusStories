//
//  StoryListView.swift
//  StatusStories
//
//  Created by Mohshin on 16/5/20.
//  Copyright © 2020 Status Stories. All rights reserved.
//

import SwiftUI

struct StoryListView: View {
    
    let storyListViewModel: StoryListViewModel
    
    var body: some View {
        List {
            ForEach(storyListViewModel.stories, id: \.self) { story in
                StoryView(storyViewModel: story)
            }
        }
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView(storyListViewModel: StoryListViewModel(stories: storiesData))
    }
}
