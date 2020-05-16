//
// Copyright © 2020 Status Stories. All rights reserved.
//

import SwiftUI

struct Dimensions {
    static let storyHeight: CGFloat = 80.0
    static let imageSize: CGFloat = 50.0
}

struct StoryView: View {
    
    let storyViewModel: StoryViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            Image("2")
                .resizable()
                .frame(width: Dimensions.imageSize, height: Dimensions.imageSize, alignment: .center)
                .clipShape(Circle())
                
            VStack(alignment: .leading, spacing: 5) {
                Text(storyViewModel.authorName)
                    .font(.body)
                Text(storyViewModel.numberOfPostsString)
                    .font(.caption)
                    .foregroundColor(.gray)
                }
            Spacer()
        }
        .padding(EdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 0))
    }
}

struct StoryRow_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(storyViewModel: storiesData[0])
            .previewLayout(
                .fixed(width: 300, height: Dimensions.storyHeight
                )
        )
    }
}

private extension StoryViewModel {
    var authorName: String { story.authorName }
    var numberOfPostsString: String { "\(story.posts.count)" }
}
