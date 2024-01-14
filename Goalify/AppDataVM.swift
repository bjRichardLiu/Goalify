//
//  AppDataVM.swift
//  Goalify
//
//  Created by Richard on 1/13/24.
//

import Foundation

class AppDataVM: ObservableObject {
    @Published var appData: AppData

    private let tasksKey = "tasks"
    private let rewardsKey = "rewards"
    private let scoreKey = "score"

    init() {
        // Try to load saved data from UserDefaults
        if let savedTasks = UserDefaults.standard.data(forKey: tasksKey),
           let savedRewards = UserDefaults.standard.data(forKey: rewardsKey),
           let savedScore = UserDefaults.standard.value(forKey: scoreKey) as? Int,
           let decodedTasks = try? JSONDecoder().decode([Task].self, from: savedTasks),
           let decodedRewards = try? JSONDecoder().decode([Reward].self, from: savedRewards) {
            self.appData = AppData(tasks: decodedTasks, rewards: decodedRewards, score: savedScore)
        } else {
            // If no saved data, initialize with default values
            self.appData = AppData(tasks: [], rewards: [], score: 0)
            initializeDefaultData()
        }
    }

    private func initializeDefaultData() {
        // Create default tasks and rewards
        let task1 = Task(name: "Read Book for 10 min", points: 10)
        let task2 = Task(name: "Learn French", points: 20)
        let task3 = Task(name: "Exercise", points: 15)
        let task4 = Task(name: "Finish all HW for the week", points: 50, isDaily: false)
        let task5 = Task(name: "Do laundry", points: 15, isDaily: false)

        let reward1 = Reward(name: "Eat Out", points: 50, canRedeem: true)
        let reward2 = Reward(name: "Buy a new game", points: 200, canRedeem: false)

        // Set tasks and rewards
        self.appData.tasks = [task1, task2, task3, task4, task5]
        self.appData.rewards = [reward1, reward2]
        self.appData.score = 0
    }


    // Save data to UserDefaults
    private func saveData() {
        if let encodedTasks = try? JSONEncoder().encode(appData.tasks),
           let encodedRewards = try? JSONEncoder().encode(appData.rewards) {
            UserDefaults.standard.set(encodedTasks, forKey: tasksKey)
            UserDefaults.standard.set(encodedRewards, forKey: rewardsKey)
            UserDefaults.standard.set(appData.score, forKey: scoreKey)
        }
    }
    
    // Func for testing
    func resetData() {
        UserDefaults.standard.removeObject(forKey: tasksKey)
        UserDefaults.standard.removeObject(forKey: rewardsKey)
        UserDefaults.standard.removeObject(forKey: scoreKey)
        
        // Initialize with default values again
        initializeDefaultData()
    }
    
    
    // Resets task completion every day/week
    func resetTaskCompletion() {
        let currentDate = Date()

        for index in appData.tasks.indices {
            if appData.tasks[index].isDaily {
                // Reset completion for daily tasks if lastCompletedDate is not today
                if let lastCompletedDate = appData.tasks[index].lastCompletedDate,
                   !Calendar.current.isDateInToday(lastCompletedDate) {
                    appData.tasks[index].isCompleted = false
                }
            } else {
                // Reset completion for non-daily tasks if lastCompletedDate is not within the current week
                if let lastCompletedDate = appData.tasks[index].lastCompletedDate,
                   !Calendar.current.isDate(lastCompletedDate, equalTo: currentDate, toGranularity: .weekOfYear) {
                    appData.tasks[index].isCompleted = false
                }
            }
        }

        saveData()
    }
    
    // MARK: - Task Operations

    func addTask(name: String, points: Int, isDaily: Bool) {
        let newTask = Task(name: name, points: points, isDaily: isDaily)
        appData.tasks.append(newTask)
        saveData()
    }

    func toggleTaskCompletion(task: Task) {
        if let index = appData.tasks.firstIndex(where: { $0.id == task.id }) {
            if !appData.tasks[index].isCompleted {
                appData.tasks[index].isCompleted = true
                appData.tasks[index].lastCompletedDate = Date()
                appData.score += appData.tasks[index].points
            }
            saveData()
        }
    }
    
    func deleteTask(task: Task) {
        if let index = appData.tasks.firstIndex(where: { $0.id == task.id }) {
            appData.tasks.remove(at: index)
        }
        saveData()
    }

    // MARK: - Reward Operations
    
    func checkRedeembility() {
        for index in appData.rewards.indices {
            if appData.rewards[index].points <= appData.score {
                appData.rewards[index].canRedeem = true
            } else {
                appData.rewards[index].canRedeem = false
            }
        }
    }

    func addReward(name: String, points: Int, canRedeem: Bool) {
        let newReward = Reward(name: name, points: points, canRedeem: canRedeem)
        appData.rewards.append(newReward)
        saveData()
    }

    func redeemReward(reward: Reward) {
        if let index = appData.rewards.firstIndex(where: { $0.id == reward.id }) {
            if !appData.rewards[index].isRedeemed {
                appData.rewards[index].isRedeemed = true
                appData.score -= appData.rewards[index].points
                appData.rewards.remove(at: index)
                saveData()
            }
        }
    }
    
    func deleteReward(reward: Reward) {
        if let index = appData.rewards.firstIndex(where: { $0.id == reward.id }) {
            appData.rewards.remove(at: index)
            saveData()
        }
    }
}
