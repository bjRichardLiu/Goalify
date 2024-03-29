//
//  Reward.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import Foundation

struct Reward: Identifiable, Codable {
    var id = UUID()
    var name: String
    var points: Int
    var isRedeemed: Bool = false
    var canRedeem: Bool = true
    var numRedeemed: Int = 0
}
