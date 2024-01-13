//
//  AddRewardsView.swift
//  Goalify
//
//  Created by Richard on 1/13/24.
//

import SwiftUI

struct AddRewardsView: View {
    // Use Binding to get the real [Reward]
    @Binding var rewards: [Reward]
    @Binding var showAddReward: Bool
    @Binding var score: Int
    
    @State private var rewardName: String = ""
    @State private var rewardPoints: String = ""
    
    enum Focused {
        case name
        case points
    }
    
    @FocusState private var focused: Focused?

    var body: some View {
        Form {
            Section(header: Text("Reward Name")) {
                TextField("Name", text: $rewardName)
                    .focused($focused, equals: .name)
            }
            Section(header: Text("Cost")) {
                TextField("Reward Cost (30-1000)", text: $rewardPoints)
                    .focused($focused, equals: .points)
                    .keyboardType(.numberPad)
            }
            
            Section {
                Button("Add Reward") {
                    addReward()
                }
                Button("Cancel") {
                    showAddReward = false
                }
            }
        }
        .onAppear {
            focused = .name
        }
    }
    
    private func addReward() {
        guard let points = Int(rewardPoints), !rewardName.isEmpty, points >= 30, points <= 1000 else {
            // Handle invalid input
            return
        }
        
        var canReedem: Bool {
            return score > points ? true : false
        }
        let newReward = Reward(name: rewardName, points: points, canRedeem: canReedem)
        rewards.append(newReward)
        
        // Reset fields
        rewardName = ""
        rewardPoints = ""
        
        // Move focus back to reward name
        focused = .name
        showAddReward = false
    }
}

