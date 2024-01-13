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
    }
}

private var TaskTitle: some View {
    Text("Complete task to ear points!")
}

private var Tasks: some View {
    Text("Tasks")
}

#Preview {
    TasksView()
}
