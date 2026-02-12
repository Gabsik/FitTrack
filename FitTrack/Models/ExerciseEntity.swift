//
//  File.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 04.02.2026.
//

import Foundation
import SwiftData

@Model
final class ExerciseEntity {
    var id: UUID = UUID()
    var name: String
    var sets: Int?
    var reps: Int?
    var weight: Int?
    var categoryId: String

    init(id: UUID = UUID(), name: String, sets: Int? = nil, reps: Int? = nil, weight: Int? = nil, categoryId: String) {
        self.id = id
        self.name = name
        self.sets = sets
        self.reps = reps
        self.weight = weight
        self.categoryId = categoryId
    }

}
