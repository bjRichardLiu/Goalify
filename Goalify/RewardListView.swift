//
//  RewardListView.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import SwiftUI

struct RewardListView: View {
    @ObservedObject var appDataVM: AppDataVM
    
    let cornerRadius: CGFloat = 5
    let circleSize: CGFloat = 20
    let leadingPadding: CGFloat = 8
    let trailingPadding: CGFloat = 10
    let verticalPadding: CGFloat = 15
    
    /*
    @State private var rewards = [
        Reward(name: "Reward 1", points: 50),
        Reward(name: "Reward 2", points: 100),
        Reward(name: "Reward 3", points: 75),
        Reward(name: "Reward 4", points: 120, canRedeem: false),
        Reward(name: "Reward 5", points: 90, canRedeem: false)
    ]
     */
    
    var canRedeem: Bool
    
    var rewardsToShow: [Reward] {
        appDataVM.appData.rewards.filter { reward in
            canRedeem ? reward.canRedeem : !reward.canRedeem
        }
    }
    
    var cellColor: Color {
        canRedeem ? ColorPalette.primaryColor : ColorPalette.deactivateColor
    }
    
    var body: some View {
        LazyVStack {
            ForEach(rewardsToShow) { reward in
                HStack {
                    // Circle for completion
                    Circle()
                        .frame(width: circleSize, height: circleSize)
                        .foregroundColor(reward.isRedeemed ? .green : .gray)
                        .onTapGesture {
                            if (reward.canRedeem) {
                                redeemReward(for: reward)
                            }
                        }
                        .padding(.horizontal)
                    
                    // Reward name aligned to the left
                    Text(reward.name)
                        .foregroundColor(.white)
                        .padding(.vertical, verticalPadding)
                    
                    // Points aligned to the right
                    Spacer()
                    Text("\(reward.points)")
                        .padding(.leading, leadingPadding)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(cellColor))
                .padding(.horizontal)
            }
        }
    }
    func redeemReward(for reward: Reward) {
        appDataVM.redeemReward(reward: reward)
    }

}

