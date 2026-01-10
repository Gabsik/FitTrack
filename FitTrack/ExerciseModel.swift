//
//  ExerciseModel.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 06.01.2026.
//

import Foundation

public struct ExerciseModel {
    public var id: UUID = UUID()
    public var name: String
    public var sets: Int
    public var reps: Int
    public var weight: Int
    public var category: String
}
