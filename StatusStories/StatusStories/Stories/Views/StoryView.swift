//
// Copyright © 2020 Status Stories. All rights reserved.
//

import SwiftUI

struct Dimensions {
    static let storyHeight: CGFloat = 50.0
}

struct StoryView: View {
    
    var storyAuthorName: String = ""
    var numberOfUpdates: Int = 0
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(systemName: "person")
                .resizable()
                .frame(width: Dimensions.storyHeight, height: Dimensions.storyHeight, alignment: .center)
                .cornerRadius(30)
                
            VStack(alignment: .leading, spacing: 2) {
                Text(storyAuthorName)
                    .font(.body)
                Text("\(numberOfUpdates)")
                    .font(.caption)
                    .foregroundColor(.gray)
                }
            Spacer()
        }
        .background(Color.blue)
    }
}

struct StoryRow_Previews: PreviewProvider {
    static var previews: some View {
        StoryView()
            .previewLayout(
                .fixed(width: 300, height: Dimensions.storyHeight
                )
        )
    }
}
