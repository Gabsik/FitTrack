//
//  CreateExerciseCoordinator.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 03.02.2026.
//

import UIKit
import SwiftData

final class CreateExerciseCoordinator {
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func makeRootCreateExercise() -> UIViewController {
        let categories = ExerciseCategory.allCases.map(\.title)
        let viewModel = CreateExerciseViewModel(
            state: .init(
                name: "",
                category: categories.first ?? "",
                sets: "",
                reps: "",
                weight: "",
                categories: categories
            ),
            modelContext: modelContext
        )
        let view = CreateExerciseView(viewModel: viewModel)
        return BetterHostingController(rootView: view)
    }
}
