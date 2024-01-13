//
//  TasksView.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import SwiftUI

struct TasksView: View {
    @ObservedObject var appDataVM: AppDataVM
    
    var body: some View {
        VStack {
            TaskTitle(appDataVM: appDataVM)
                .padding(.top)
            Tasks(appDataVM: appDataVM)
        }
        .background(ColorPalette.neutralColor)
    }
}

private func TaskTitle(appDataVM: AppDataVM) -> some View {
    return HStack {
        Text("Tasks")
            .foregroundStyle(ColorPalette.accentColor)
            .font(.system(size: 50))
            .bold()
        Spacer()
        Text("Score: \(appDataVM.appData.score)")
    }
    .padding(.horizontal, 30)
}

private func Tasks(appDataVM: AppDataVM) -> some View {
    
    return ScrollView {
        Text("Daily")
            .foregroundStyle(ColorPalette.accentColor)
            .font(.system(size: 30))
            .bold()
        TaskListView(appDataVM: appDataVM, dailyTasks: true)
        Text("Weekly")
            .foregroundStyle(ColorPalette.accentColor)
            .font(.system(size: 30))
            .bold()
        TaskListView(appDataVM: appDataVM, dailyTasks: false)
    }
}
