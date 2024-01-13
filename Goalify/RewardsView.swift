//
//  RewardsView.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import SwiftUI

struct RewardsView: View {
    @ObservedObject var appDataVM: AppDataVM
    
    init(appDataVM: AppDataVM) {
        self.appDataVM = appDataVM
    }
    
    var body: some View {
        VStack {
            RewardsTitle(appDataVM: appDataVM)
            Rewards(appDataVM: appDataVM)
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
    .padding(.horizontal, 30)
}

private func Rewards(appDataVM: AppDataVM) -> some View {
    ScrollView {
        Text("Redeemable!")
        RewardListView(appDataVM: appDataVM, canRedeem: true)
        Text("Keep Working!")
        RewardListView(appDataVM: appDataVM, canRedeem: false)
    }
}

