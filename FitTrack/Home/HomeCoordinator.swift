//
//  HomeCoordinator.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 30.12.2025.
//

import UIKit
import SwiftData

final class HomeCoordinator {
    private let navigationController: UINavigationController
    private var workoutDayCoordinator: WorkoutDayCoordinator?
    private var myExercisesCoordinator: MyExercisesCoordinator?
    private let modelContext: ModelContext

    init(navigationController: UINavigationController, modelContext: ModelContext) {
        self.navigationController = navigationController
        self.modelContext = modelContext
    }

    func makeRootHome() -> UIViewController {
        let viewModel = HomeViewModel(
            state: .init(),
            output: { [weak self] output in
                switch output {
                case .showMyExercises:
                    self?.showMyExercises()
                case .showWorkoutDayView(let date):
                    self?.showWorkoutDayView(date: date)
                }
            }
        )
        let view = HomeView(viewModel: viewModel)
        let vc = BetterHostingController(rootView: view)
        return vc
    }

    private func showWorkoutDayView(date: Date) {
        let vc = makeWorkoutDayView(selectedDate: date)
        navigationController.pushViewController(vc,animated: true)
    }

    private func makeWorkoutDayView(selectedDate: Date) -> UIViewController {
        let coordinator = WorkoutDayCoordinator(navigationController: navigationController, modelContext: modelContext)
        workoutDayCoordinator = coordinator
        return coordinator.makeRootWorkoutDay(selectedDate: selectedDate)
    }

    private func showMyExercises() {
        let vc = makeMyExercises()
        vc.modalPresentationStyle = .fullScreen
        navigationController.present(vc, animated: true)
    }

    private func makeMyExercises() -> UIViewController {
        let coordinator = MyExercisesCoordinator(modelContext: modelContext)
        myExercisesCoordinator = coordinator
        return coordinator.makeRootMyExercises()
    }

}
