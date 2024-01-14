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
                    Spacer()
                    Button {
                        showAddReward.toggle()
                    } label: {
                        Image(systemName: "note.text.badge.plus")
                            .font(.system(size: 30))
                            .foregroundStyle(ColorPalette.accentColor)
                    }
                    .sheet(isPresented: $showAddReward) {
                        AddRewardsView(rewards: $appDataVM.appData.rewards, showAddReward: $showAddReward, score: $appDataVM.appData.score)
                    }
                    .padding(.trailing)
                    .foregroundStyle(ColorPalette.secondaryColor)
                    
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
            .foregroundStyle(ColorPalette.secondaryColor)
            .font(.system(size: 50))
            .bold()
        Spacer()
        Text("Score: \(appDataVM.appData.score)")
            .foregroundStyle(ColorPalette.deactivateColor)
            .bold()
    }
    .padding(.horizontal)
    .padding(.top)
}

