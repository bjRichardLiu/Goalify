//
//  TasksView.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import SwiftUI

struct TasksView: View {
    @ObservedObject var appDataVM: AppDataVM
    
    @State private var showAddDailyTask = false
    @State private var showAddWeeklyTask = false
    
    var body: some View {
        VStack {
            TaskTitle(appDataVM: appDataVM)
            ScrollView {
                HStack {
                    Text("Daily")
                        .foregroundStyle(ColorPalette.accentColor)
                        .font(.system(size: 30))
                        .bold()
                        .padding(.leading)
                    Button {
                        showAddDailyTask.toggle()
                    } label: {
                        Image(systemName: "plus.square")
                            .font(.system(size: 30))
                    }
                    .sheet(isPresented: $showAddDailyTask) {
                        AddDailyTaskView(tasks: $appDataVM.appData.tasks, showAddDailyTask: $showAddDailyTask)
                            .presentationDetents([.large, .medium, .fraction(0.75)])
                    }
                    Spacer()
                }
                TaskListView(appDataVM: appDataVM, dailyTasks: true)
                    .padding(.bottom, 30)
                HStack {
                    Text("Weekly")
                        .foregroundStyle(ColorPalette.accentColor)
                        .font(.system(size: 30))
                        .bold()
                        .padding(.leading)
                    Button {
                        showAddWeeklyTask.toggle()
                    } label: {
                        Image(systemName: "plus.square")
                            .font(.system(size: 30))
                    }
                    .sheet(isPresented: $showAddWeeklyTask) {
                        AddWeeklyTaskView(tasks: $appDataVM.appData.tasks, showAddWeeklyTask: $showAddWeeklyTask)
                    }
                    Spacer()
                }
                TaskListView(appDataVM: appDataVM, dailyTasks: false)
            }
            Button {
                appDataVM.resetData()
            } label: {
                Image(systemName: "gearshape")
                    .font(.system(size: 30))
            }
            
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
    .padding(.horizontal)
    .padding(.top)
}
/*
private func Tasks(appDataVM: AppDataVM) -> some View {
    
    return ScrollView {
        HStack {
            Text("Daily")
                .foregroundStyle(ColorPalette.accentColor)
                .font(.system(size: 30))
                .bold()
                .padding(.leading)
            Spacer()
        }
        TaskListView(appDataVM: appDataVM, dailyTasks: true)
            .padding(.bottom, 30)
        HStack {
            Text("Weekly")
                .foregroundStyle(ColorPalette.accentColor)
                .font(.system(size: 30))
                .bold()
                .padding(.leading)
            Spacer()
        }
        TaskListView(appDataVM: appDataVM, dailyTasks: false)
    }
}
*/
