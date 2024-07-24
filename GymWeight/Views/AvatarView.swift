//
//  AvatarView.swift
//  GymWeight
//
//  Created by Ramon Xavier on 23/07/24.
//

import SwiftUI

enum AvatarImageShape {
  case round
  case rectangle
}

struct AvatarView: View {
    var user: User

    @ViewBuilder
    var body: some View {
          AsyncImage(url: URL(string: "https://avatars.githubusercontent.com/u/38158476?v=4")) { phase in
                   switch phase {
                   case .empty:
                       ProgressView()
                           .frame(width: Constants.width, height: Constants.height)
                           .clipShape(Circle())
                   case .success(let image):
                       image
                           .resizable()
                           .aspectRatio(contentMode: .fill)
                           .frame(width: Constants.width, height: Constants.height)
                           .clipShape(Circle())
                   case .failure:
                       Image(systemName: "person.fill")
                           .resizable()
                           .aspectRatio(contentMode: .fit)
                           .frame(width: Constants.width, height: Constants.height)
                           .clipShape(Circle())
                   @unknown default:
                       EmptyView()
                   }
               }
          .accessibilityElement(children: .contain)
          .accessibilityLabel(user.fullName)
      }
    
    struct Constants {
        static let width: CGFloat = 60
        static let height: CGFloat = 60
    }
}

#Preview {
  AvatarView(user: User.sample)
      .padding()
}
