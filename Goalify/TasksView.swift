//
//  TasksView.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import SwiftUI

struct TasksView: View {
    var body: some View {
        VStack {
            TaskTitle
            Tasks
        }
        .background(ColorPalette.neutralColor)
    }
}

private var TaskTitle: some View {
    Text("Complete task to ear points!")
}

private var Tasks: some View {
    ScrollView {
        Text("Daily")
        TaskListView(dailyTasks: true)
        Text("Weekly")
        TaskListView(dailyTasks: false)
    }
}

#Preview {
    TasksView()
}
