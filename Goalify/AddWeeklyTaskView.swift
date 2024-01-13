//
//  AddWeeklyTaskView.swift
//  Goalify
//
//  Created by Richard on 1/13/24.
//

import SwiftUI

struct AddWeeklyTaskView: View {
    // Use Binding to get the real [Task]
    @Binding var tasks: [Task]
    @Binding var showAddWeeklyTask: Bool
    
    @State private var taskName: String = ""
    @State private var taskPoints: String = ""
    
    enum Focused {
        case name
        case points
    }
    
    @FocusState private var focused: Focused?

    var body: some View {
        Form {
            Section(header: Text("Task Name")) {
                TextField("Name", text: $taskName)
                    .focused($focused, equals: .name)
            }
            
            Section(header: Text("Points")) {
                TextField("Task Points (5-100)", text: $taskPoints)
                    .focused($focused, equals: .points)
                    .keyboardType(.numberPad)
            }
            Section {
                Button("Add Task") {
                    addWeeklyTask()
                }
                Button("Cancel") {
                    showAddWeeklyTask = false
                }
            }
        }
        .onAppear {
            focused = .name
        }
    }
    
    
    private func addWeeklyTask() {
        guard let points = Int(taskPoints), !taskName.isEmpty, points >= 5, points <= 100 else {
            // Handle invalid input
            return
        }
        
        let newTask = Task(name: taskName, points: points, isDaily: false)
        tasks.append(newTask)
        
        // Reset fields
        taskName = ""
        taskPoints = ""
        
        // Move focus back to task name
        focused = .name
        showAddWeeklyTask = false
    }
}

