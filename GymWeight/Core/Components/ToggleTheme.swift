//
//  ToggleTheme.swift
//  GymWeight
//
//  Created by Ramon Xavier on 13/07/24.
//

import SwiftUI

struct ToggleTheme: View {
    @Binding var isOn: Bool
    
    var body: some View {
       Toggle("", isOn: $isOn)
            .toggleStyle(CustomToggleStyle())
    }
}

struct CustomToggleStyle: ToggleStyle {
    @Namespace var namespace
    
    func makeBody(configuration: Configuration) -> some View {
        let isOn = configuration.isOn
        
        return ZStack {
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .frame(width: 140, height: 50)
                .foregroundColor(isOn ? .sun : .moon)
                .overlay(alignment: .leading) {
                    ZStack {
                        Image("Moon")
                            .resizable()
                            .frame(width: 110, height: 45)
                            .offset(x: isOn ? -115 : 0)
                            .padding(.leading, 5)
                        Image("Moon")
                            .resizable()
                            .frame(width: 80, height: 45)
                            .offset(x: isOn ? 35 : 135)
                            .padding(.leading, 5)
                    }
                }
                .overlay(alignment: .leading) {
                    
                    if !isOn {
                        Moon()
                            .matchedGeometryEffect(id: "Circle", in: namespace)
                            .offset(x: isOn ? 5 : 95)
                    } else {
                        Circle()
                            .matchedGeometryEffect(id: "Circle", in: namespace)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.yellow)
                            .offset(x: isOn ? 5 : 95)
                    }
                }
        }
        .mask({
            RoundedRectangle(cornerRadius: 40, style: .continuous)
                .frame(width: 140, height: 50)
        })
        .onTapGesture {
            withAnimation(.spring(response: 0.8, dampingFraction: 0.9)) {
                configuration.isOn.toggle()
            }
        }
    }
}

#Preview {
    @State var isOff = false
    @State var isOn = true

    return VStack {
        ToggleTheme(isOn: $isOff)
        ToggleTheme(isOn: $isOn)
    }
}
