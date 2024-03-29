//
//  Task.swift
//  Goalify
//
//  Created by Richard on 1/12/24.
//

import Foundation

struct Task: Identifiable, Codable {
    var id = UUID()
    var name: String
    var points: Int
    var isCompleted: Bool = false
    var isDaily: Bool = true
    var lastCompletedDate: Date?
}
