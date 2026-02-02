//
//  HomeCoordinator.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 30.12.2025.
//

import UIKit

final class HomeCoordinator {
    private let window: UIWindow
    private weak var rootVC: UIViewController?
    private let navigationController = UINavigationController()

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let root = makeRootHome()
        rootVC = root
        navigationController.setViewControllers([root], animated: false)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
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
        let viewModel = WorkoutDayViewModel(
            state: .init(selectedDate: selectedDate),
            output: { [weak self] output in
            }
        )
        let view = WorkoutDayView(viewModel: viewModel)
        return BetterHostingController(shouldShowNavigationBar: true, rootView: view)
    }

    private func showMyExercises() {
        let vc = makeMyExercises()
        vc.modalPresentationStyle = .fullScreen
        rootVC?.present(vc, animated: true)
    }

    private func makeMyExercises() -> UIViewController {
        let viewModel = MyExercisesViewModel()
        let view = MyExercisesView(viewModel: viewModel)
        return BetterHostingController(rootView: view)
    }

}
