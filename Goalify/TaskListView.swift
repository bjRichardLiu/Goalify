//
//  TaskListView.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var appDataVM: AppDataVM
    @State private var selectedTask: Task?
    
    let cornerRadius: CGFloat = 5
    let circleSize: CGFloat = 20
    let leadingPadding: CGFloat = 8
    let trailingPadding: CGFloat = 10
    let verticalPadding: CGFloat = 15
    
    /*
    @State private var tasks = [
        Task(name: "Task 1", points: 10),
        Task(name: "Task 2", points: 20),
        Task(name: "Task 3", points: 15),
        Task(name: "Task 1", points: 10),
        Task(name: "Task 2", points: 20),
        Task(name: "Task 3", points: 15),
        Task(name: "Task 1", points: 10),
        Task(name: "Task 2", points: 20),
        Task(name: "Task 3", points: 15),
        Task(name: "Task 4", points: 20, isDaily: false),
        Task(name: "Task 5", points: 15, isDaily: false)
        
    ]
    */
    
    
    
    var dailyTasks: Bool
    
    var tasksToShow: [Task] {
        appDataVM.appData.tasks.filter { task in
            dailyTasks ? task.isDaily : !task.isDaily
        }
    }
    

    var body: some View {
        LazyVStack {
            ForEach(tasksToShow) { task in
                var complete: String {
                    task.isCompleted ? "checkmark.circle.fill" : "circle"
                }
                HStack {
                    // Circle for completion
                    Image(systemName: complete)
                        .onTapGesture {
                            // Assuming you have a method to toggle completion
                            toggleCompletion(for: task)
                        }
                        .padding(.horizontal)
                        .font(.title)

                    // Task name aligned to the left
                    Text(task.name)
                        //.padding(.leading, leadingPadding)
                        .foregroundColor(.white)
                        .padding(.vertical, verticalPadding)
                        .bold()

                    // Points aligned to the right
                    Spacer()
                    Text("+\(task.points)")
                        .padding(.leading, leadingPadding)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .bold()
                }
                .background(RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(ColorPalette.primaryColor))
                .padding(.horizontal)
                .onLongPressGesture {
                    selectedTask = task
                }
            }
        }
        .actionSheet(item: $selectedTask) { task in
            // Action sheet for delete confirmation
            ActionSheet(
                title: Text("Delete Task"),
                buttons: [
                    .destructive(Text("Delete")) {
                        // Delete the selected task
                        deleteTask(task)
                    },
                    .cancel()
                ]
            )
        }
        /*
        List(tasksToShow) { task in
            HStack {
                // Circle for completion
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(task.isCompleted ? .green : .gray)
                    .onTapGesture {
                        toggleCompletion(for: task)
                    }

                // Task name aligned to the left
                Text(task.name)
                    .padding(.leading, 8)

                // Points aligned to the right
                Spacer()
                Text("+\(task.points)")
                    .padding(.leading, 8)
            }
            .listRowBackground(Color.blue)
        }
        .background(.black)
        .scrollContentBackground(.hidden)
         */
    }
    

    func toggleCompletion(for task: Task) {
        appDataVM.toggleTaskCompletion(task: task)
    }
    
    func deleteTask(_ task: Task) {
        appDataVM.deleteTask(task: task)
    }
}

