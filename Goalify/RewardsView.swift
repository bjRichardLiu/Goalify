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
    }
}

private var RewardsTitle: some View {
    Text("Redeam your points!")
}

private var Rewards: some View {
    Text("Rewards")
}

#Preview {
    RewardsView()
}
