//
//  CreateExerciseViewModel.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 03.02.2026.
//

import Foundation
import SwiftData

final class CreateExerciseViewModel: ObservableObject {

    @Published var state: State
    private let modelContext: ModelContext
    var input: ((Input) -> Void)?

    init(
        state: State,
        modelContext: ModelContext
    ) {
        self.state = state
        self.modelContext = modelContext
    }

    func createExercise() {
        let trimmedName = state.name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedName.isEmpty else { return }
        guard let category = ExerciseCategory.from(title: state.category) else { return }

        let setsValue = Int(state.sets)
        let repsValue = Int(state.reps)
        let weightValue = Int(state.weight)

        let exercise = ExerciseEntity(
            name: trimmedName,
            sets: setsValue,
            reps: repsValue,
            weight: weightValue,
            categoryId: category.id
        )
        modelContext.insert(exercise)
        try? modelContext.save()
    }
}

extension CreateExerciseViewModel {
    struct State {
        var name: String
        var category: String
        var sets: String
        var reps: String
        var weight: String
        var categories: [String]
    }
}

extension CreateExerciseViewModel {
    enum Input {
        case createExercisesTapped
    }
}

extension CreateExerciseViewModel {
    enum Output {

    }
}
