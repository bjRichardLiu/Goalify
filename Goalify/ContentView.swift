//
//  ContentView.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TasksView()
            .tabItem {
                Label("Tasks", systemImage: "list.bullet")
            }
            .toolbarBackground(ColorPalette.neutralColor, for: .tabBar)

            RewardsView()
            .tabItem {
                Label("Rewards", systemImage: "gift")
            }
            .toolbarBackground(ColorPalette.neutralColor, for: .tabBar)
        }
    }
}

#Preview {
    ContentView()
}
