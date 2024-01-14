//
//  RewardsView.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import SwiftUI

struct RewardsView: View {
    @ObservedObject var appDataVM: AppDataVM
    @State var showAddReward = false
    
    init(appDataVM: AppDataVM) {
        self.appDataVM = appDataVM
    }
    
    var body: some View {
        VStack {
            RewardsTitle(appDataVM: appDataVM)
            ScrollView {
                HStack {
                    Text("Rewards to Redeem!")
                        .foregroundStyle(ColorPalette.accentColor)
                        .font(.system(size: 30))
                        .bold()
                        .padding(.leading)
                    Button {
                        showAddReward.toggle()
                    } label: {
                        Image(systemName: "plus.square")
                            .font(.system(size: 30))
                    }
                    .sheet(isPresented: $showAddReward) {
                        AddRewardsView(rewards: $appDataVM.appData.rewards, showAddReward: $showAddReward, score: $appDataVM.appData.score)
                    }
                    Spacer()
                }
                
                RewardListView(appDataVM: appDataVM, canRedeem: true)
                RewardListView(appDataVM: appDataVM, canRedeem: false)
            }
        }
        .background(ColorPalette.neutralColor)
        .onAppear {
            appDataVM.checkRedeembility()
        }
    }
}


private func RewardsTitle(appDataVM: AppDataVM) -> some View {
    return HStack {
        Text("Rewards")
            .foregroundStyle(ColorPalette.accentColor)
            .font(.system(size: 50))
            .bold()
        Spacer()
        Text("Score: \(appDataVM.appData.score)")
    }
    .padding(.horizontal)
    .padding(.top)
}

