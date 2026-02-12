//
//  MyExercisesViewModel.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 03.01.2026.
//

import Foundation
import SwiftData

final class MyExercisesViewModel: ObservableObject {
    private let modelContext: ModelContext
//    let arryButton = ["Все"] + ExerciseCategory.allCases.map(\.title)
    @Published var exercises: [ExerciseModel] = []
    @Published var selectedCategory: String = "Все"

    private let output: (Output) -> Void
    var input: ((Input) -> Void)?

    init(modelContext: ModelContext, output: @escaping (Output) -> Void = { _ in }) {
        self.modelContext = modelContext
        self.output = output
    }

    func bind() {
        self.input = { [weak self] input in
            guard let self else { return }
            switch input {
            case .createExerciseTapped:
                output(.showCreateExercise)
            }
        }
        fetchExercises()
    }

    private func fetchExercises() {
        do {
            let descriptor = FetchDescriptor<ExerciseEntity>()
            let items = try modelContext.fetch(descriptor)
            exercises = items.map {
                ExerciseModel(
                    id: $0.id,
                    name: $0.name,
                    sets: $0.sets,
                    reps: $0.reps,
                    weight: $0.weight,
                    categoryId: $0.categoryId
                )
            }
        } catch {
            exercises = []
        }
    }

    var filteredExercises: [ExerciseModel] {
        guard selectedCategory != "Все" else { return exercises }
        guard let category = ExerciseCategory.from(title: selectedCategory) else { return exercises }
        return exercises.filter { $0.categoryId == category.id }
    }
}

extension MyExercisesViewModel {
    enum Input {
        case createExerciseTapped
    }
}

extension MyExercisesViewModel {
    enum Output {
        case showCreateExercise
    }
}
