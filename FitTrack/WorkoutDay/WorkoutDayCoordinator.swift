//
//  WorkoutDayCoordinator.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 02.02.2026.
//

import UIKit

final class WorkoutDayCoordinator {
    private weak var navigationController: UINavigationController?
    private var myExercisesCoordinator: MyExercisesCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
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
        let coordinator = MyExercisesCoordinator()
        myExercisesCoordinator = coordinator
        return coordinator.makeRootMyExercises()
    }
}
