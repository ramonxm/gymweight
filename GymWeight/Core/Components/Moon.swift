//
//  Moon.swift
//  GymWeight
//
//  Created by Ramon Xavier on 13/07/24.
//

import SwiftUI

struct Moon: View {
    var body: some View {
          ZStack {
              Circle()
                  .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.gray]), startPoint: .top, endPoint: .bottom))
                  .frame(width: 40, height: 40)
                  .shadow(color: Color.gray.opacity(0.5), radius: 10, x: 5, y: 5)
          }
      }
}

#Preview {
    Moon()
}
