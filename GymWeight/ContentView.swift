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
          ToggleTheme(isOn: $changeTheme)
            
        }
    }


}

#Preview {
    ContentView()
}
