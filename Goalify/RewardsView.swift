//
//  RewardsView.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import SwiftUI

struct RewardsView: View {
    @ObservedObject var appDataVM: AppDataVM
    
    var body: some View {
        VStack {
            RewardsTitle
            Rewards(appDataVM: appDataVM)
        }
        .background(ColorPalette.neutralColor)
    }
}

private var RewardsTitle: some View {
    HStack {
        Text("Rewards")
            .foregroundStyle(ColorPalette.accentColor)
            .font(.system(size: 50))
            .bold()
        Spacer()
        Text("Score")
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

