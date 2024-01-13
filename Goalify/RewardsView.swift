//
//  RewardsView.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import SwiftUI

struct RewardsView: View {
    var body: some View {
        VStack {
            RewardsTitle
            Rewards
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

private var Rewards: some View {
    ScrollView {
        Text("Redeemable!")
        RewardListView(canRedeem: true)
        Text("Keep Working!")
        RewardListView(canRedeem: false)
    }
}

#Preview {
    RewardsView()
}
