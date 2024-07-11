//
//  ContentView.swift
//  GymWeight
//
//  Created by Ramon Xavier on 08/07/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var changeTheme: Bool = false

    var body: some View {
        NavigationStack {
            Button("Escolha o tema") {
                changeTheme.toggle()
            }
            
        }
        .sheet(isPresented: $changeTheme, content: {
            ThemeChangeView()
                .presentationDetents([.height(410)])
                .presentationBackground(.clear)
        })
    }


}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
