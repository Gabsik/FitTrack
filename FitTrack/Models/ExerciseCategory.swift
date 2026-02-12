//
//  ExerciseCategory.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 04.02.2026.
//

import Foundation

enum ExerciseCategory: String, CaseIterable {
    case chest = "chest"
    case biceps = "biceps"
    case legs = "legs"
    case shoulders = "shoulders"
    case back = "back"
    case triceps = "triceps"
    case press = "press"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .chest: return "Грудь"
        case .biceps: return "Бицепс"
        case .legs: return "Ноги"
        case .shoulders: return "Плечи"
        case .back: return "Спина"
        case .triceps: return "Трицепс"
        case .press: return "Пресс"
        }
    }
}

extension ExerciseCategory {
    static func from(title: String) -> ExerciseCategory? {
        allCases.first { $0.title == title }
    }
}
