//
//  TaskListView.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import SwiftUI

struct TaskListView: View {
    
    let cornerRadius: CGFloat = 5
    let circleSize: CGFloat = 20
    let leadingPadding: CGFloat = 8
    let trailingPadding: CGFloat = 6
    let verticalPadding: CGFloat = 10
    
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
    
    
    
    var dailyTasks: Bool
    
    var tasksToShow: [Task] {
        tasks.filter { task in
            dailyTasks ? task.isDaily : !task.isDaily
        }
    }

    var body: some View {
        LazyVStack {
            ForEach(tasksToShow) { task in
                HStack {
                    // Circle for completion
                    Circle()
                        .frame(width: circleSize, height: circleSize)
                        .foregroundColor(task.isCompleted ? .green : .gray)
                        .onTapGesture {
                            // Assuming you have a method to toggle completion
                            toggleCompletion(for: task)
                        }
                        .padding(.leading, leadingPadding)

                    // Task name aligned to the left
                    Text(task.name)
                        .padding(.leading, leadingPadding)
                        .foregroundColor(.white)
                        .padding(.vertical, verticalPadding)

                    // Points aligned to the right
                    Spacer()
                    Text("+\(task.points)")
                        .padding(.leading, leadingPadding)
                        .foregroundColor(.white)
                        .padding(.trailing, trailingPadding)
                }
                .background(RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(ColorPalette.primaryColor))
                .padding(.horizontal)
            }
        }
        //.background(Color.black) // Set background color for the entire LazyVStack
        
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
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
        }
    }
}


#Preview {
    TaskListView(dailyTasks: true)
}
