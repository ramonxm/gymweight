//
//  HomeView.swift
//  GymWeight
//
//  Created by Ramon Xavier on 23/07/24.
//

import SwiftUI

struct HomeView: View {
    private let user = User(fullName: "Teste")

    
    var body: some View {
        VStack {
            HStack {
                Text("GYMWEIGHT")
                    .font(.title)
                    .padding(.horizontal)
                Spacer()
                ZStack {
                    AvatarView(user: User.sample)
                }
                .padding(.horizontal)
            }
            Color.white
        }
    }
}

#Preview {
    HomeView()
}
