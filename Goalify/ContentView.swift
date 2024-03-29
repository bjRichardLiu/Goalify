//
//  ContentView.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var appDataVM = AppDataVM()


    var body: some View {
        TabView {
            TasksView(appDataVM: appDataVM)
            .tabItem {
                Label("Tasks", systemImage: "list.clipboard.fill")
            }
            .toolbarBackground(ColorPalette.neutralColor, for: .tabBar)

            RewardsView(appDataVM: appDataVM)
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
