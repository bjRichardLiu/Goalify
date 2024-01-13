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
                .padding(.top)
            Tasks
        }
        .background(ColorPalette.neutralColor)
    }
}

private var TaskTitle: some View {
    HStack {
        Text("Tasks")
            .foregroundStyle(ColorPalette.accentColor)
            .font(.system(size: 50))
            .bold()
        Spacer()
        Text("Score")
    }
    .padding(.horizontal, 30)
}

private var Tasks: some View {
    ScrollView {
        Text("Daily")
            .foregroundStyle(ColorPalette.accentColor)
            .font(.system(size: 30))
            .bold()
        TaskListView(dailyTasks: true)
        Text("Weekly")
            .foregroundStyle(ColorPalette.accentColor)
            .font(.system(size: 30))
            .bold()
        TaskListView(dailyTasks: false)
    }
}

#Preview {
    TasksView()
}
