//
//  AddDailyTaskView.swift
//  Goalify
//
//  Created by Richard on 1/13/24.
//

import SwiftUI

struct AddDailyTaskView: View {
    // Use Binding to get the real [Task]
    @Binding var tasks: [Task]
    @Binding var showAddDailyTask: Bool
    
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
                TextField("Task Points (5-50)", text: $taskPoints)
                    .focused($focused, equals: .points)
                    .keyboardType(.numberPad)
            }
            
            Section {
                Button("Add Task") {
                    addDailyTask()
                }
                Button("Cancel") {
                    showAddDailyTask = false
                }
            }
        }
        .onAppear {
            focused = .name
        }
    }
    
    private func addDailyTask() {
        guard let points = Int(taskPoints), !taskName.isEmpty, points >= 5, points <= 50 else {
            // Handle invalid input
            return
        }
        
        let newTask = Task(name: taskName, points: points)
        tasks.append(newTask)
        
        // Reset fields
        taskName = ""
        taskPoints = ""
        
        // Move focus back to task name
        focused = .name
        showAddDailyTask = false
    }
}
