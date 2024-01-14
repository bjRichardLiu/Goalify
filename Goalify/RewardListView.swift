//
//  RewardListView.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import SwiftUI

struct RewardListView: View {
    @ObservedObject var appDataVM: AppDataVM
    @State private var selectedReward: Reward?
    
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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 16)], spacing: 16) {
            ForEach(rewardsToShow) { reward in
                var complete: String {
                    reward.isRedeemed ? "checkmark.circle.fill" : "circle"
                }
                VStack {
                    // Circle for completion
                    /*
                    Image(systemName: complete)
                        .onTapGesture {
                            if (reward.canRedeem) {
                                redeemReward(for: reward)
                            }
                        }
                        .padding(.horizontal)
                        .font(.title)
                     */
                    
                    // Reward name aligned to the left
                    Text(reward.name)
                        .foregroundColor(.white)
                        .padding(.vertical, verticalPadding)
                    
                    // Points aligned to the right
                    //Spacer()
                    Text("\(reward.points)")
                        .padding(.vertical, verticalPadding)
                        .foregroundColor(.white)
                    Text("Redeemed × \(reward.numRedeemed)")
                        .padding(.vertical, verticalPadding)
                        .foregroundColor(.white)
                    Button {
                        if (reward.canRedeem) {
                            redeemReward(for: reward)
                        }
                    } label: {
                        Text("Redeem!")
                    }
                }
                .frame(width: 150, height: 225)
                .background(RoundedRectangle(cornerRadius: cornerRadius).foregroundColor(cellColor))
                .aspectRatio(2/3, contentMode: .fit)
                .onLongPressGesture {
                    selectedReward = reward
                }
            }
        }
        .actionSheet(item: $selectedReward) { reward in
            // Action sheet for delete confirmation
            ActionSheet(
                title: Text("Delete Reward"),
                buttons: [
                    .destructive(Text("Delete")) {
                        // Delete the selected task
                        deleteReward(reward)
                    },
                    .cancel()
                ]
            )
        }
    }
    func redeemReward(for reward: Reward) {
        withAnimation {
            appDataVM.redeemReward(reward: reward)
        }
        appDataVM.checkRedeembility()
        
    }
    
    func deleteReward(_ reward: Reward) {
        appDataVM.deleteReward(reward: reward)
    }

}

