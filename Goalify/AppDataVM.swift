//
//  AppDataVM.swift
//  Goalify
//
//  Created by Richard on 1/13/24.
//

import Foundation

class AppDataVM: ObservableObject {
    @Published var appData: AppData

//    init(appData: AppData) {
//        self.appData = appData
//    }
    
    init(appData: AppData) {
        self.appData = appData

        // Create tasks and rewards
        let task1 = Task(name: "Read Book for 10 min", points: 10)
        let task2 = Task(name: "Learn French", points: 20)
        let task3 = Task(name: "Excercise", points: 15)
        let task4 = Task(name: "Finish all HW for the week", points: 50, isDaily: false)
        let task5 = Task(name: "Do laundry", points: 15, isDaily: false)

        let reward1 = Reward(name: "Eat Out", points: 50, canRedeem: true)
        let reward2 = Reward(name: "Buy a new game", points: 200, canRedeem: false)

        // Set tasks and rewards
        self.appData.tasks = [task1, task2, task3, task4, task5]
        self.appData.rewards = [reward1, reward2]

        // Calculate the initial score
        self.appData.score = 0
    }

    // MARK: - Task Operations

    func addTask(name: String, points: Int, isDaily: Bool) {
        let newTask = Task(name: name, points: points, isDaily: isDaily)
        appData.tasks.append(newTask)
    }

    func toggleTaskCompletion(task: Task) {
        if let index = appData.tasks.firstIndex(where: { $0.id == task.id }) {
            if (!appData.tasks[index].isCompleted) {
                appData.tasks[index].isCompleted = true
                appData.score += appData.tasks[index].points
            }
        }
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
    }

    //TODO: Debug needed
    
    func redeemReward(reward: Reward) {
        if let index = appData.rewards.firstIndex(where: { $0.id == reward.id }) {
            if (!appData.rewards[index].isRedeemed) {
                appData.rewards[index].isRedeemed = true
                appData.score -= appData.rewards[index].points
            }
        }
    }
    

    // MARK: - Score Calculation
    /*
    private func updateScore() {
        let taskPoints = appData.tasks.filter { $0.isCompleted }.map { $0.points }.reduce(0, +)
        let rewardPoints = appData.rewards.filter { $0.isRedeemed }.map { $0.points }.reduce(0, +)

        appData.score = taskPoints + rewardPoints
    }
     */
    
}
