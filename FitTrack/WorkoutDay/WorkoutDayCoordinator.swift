//
//  WorkoutDayCoordinator.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 02.02.2026.
//

import UIKit
import SwiftData

final class WorkoutDayCoordinator {
    private weak var navigationController: UINavigationController?
    private var myExercisesCoordinator: MyExercisesCoordinator?
    private let modelContext: ModelContext

    init(navigationController: UINavigationController, modelContext: ModelContext) {
        self.navigationController = navigationController
        self.modelContext = modelContext
    }

    func makeRootWorkoutDay(selectedDate: Date) -> UIViewController {
        let viewModel = WorkoutDayViewModel(
            state: .init(selectedDate: selectedDate),
            output: { [weak self] output in
                switch output {
                case .showMyExercises:
                    self?.showMyExercises()
                }
            }
        )
        let view = WorkoutDayView(viewModel: viewModel)
        let vc = BetterHostingController(shouldShowNavigationBar: true, rootView: view)
        return vc
    }

    private func showMyExercises() {
        let vc = makeMyExercises()
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true)
    }

    private func makeMyExercises() -> UIViewController {
        let coordinator = MyExercisesCoordinator(modelContext: modelContext)
        myExercisesCoordinator = coordinator
        return coordinator.makeRootMyExercises()
    }
}
