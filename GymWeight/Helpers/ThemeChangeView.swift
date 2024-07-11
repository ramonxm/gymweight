//
//  ThemeChangeView.swift
//  GymWeight
//
//  Created by Ramon Xavier on 10/07/24.
//

import SwiftUI

struct ThemeChangeView: View {
    @Environment(\.colorScheme) private var scheme
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    @Namespace private var animation
    
    var body: some View {
        VStack(spacing: 15) {
            Circle()
                .fill(userTheme.color(scheme).gradient)
                .frame(width: 150, height: 150)
            
            Text("Escolha o estilo")
                .font(.title2.bold())
                .padding(.top, 25)
            
            Text("Personalize sua interface")
            
            HStack(spacing: 0) {
                ForEach(Theme.allCases, id: \.rawValue) {
                    theme in Text(theme.rawValue)
                        .padding(.vertical, 10)
                        .frame(width: 100)
                        .background {
                            ZStack {
                                if userTheme == theme {
                                    Capsule()
                                        .fill(.white)
                                        .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                                }
                            }
                            .animation(.snappy, value: userTheme)
                        }
                        .contentShape(.rect)
                        .onTapGesture {
                            userTheme = theme
                        }
                }
            }
            .padding(3)
            .background(.primary.opacity(0.06), in: .capsule)
            .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .frame(height: 410)
        .background(.white)
        .clipShape(.rect(cornerRadius: 30))
        .padding(.horizontal, 15)
    }
}

#Preview {
    ThemeChangeView()
}



enum Theme: String, CaseIterable {
    case systemDefault = "Default"
    case light = "Light"
    case dark = "Dark"
    
    func color(_ scheme: ColorScheme) -> Color {
        switch self {
        case .systemDefault:
            return scheme == .dark ? .moon : .sun
        case .light:
            return .sun
        case .dark:
            return .moon
        }
    }
}
