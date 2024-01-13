//
//  Reward.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import Foundation

struct Reward: Identifiable {
    var id = UUID()
    var name: String
    var points: Int
    var isRedeemed: Bool = false
    var canRedeem: Bool = true
}
