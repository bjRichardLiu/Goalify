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

            RewardsView()
            .tabItem {
                Label("Rewards", systemImage: "gift")
            }
        }
    }
}

#Preview {
    ContentView()
}
