//
//  MyExercisesCoordinator.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 03.02.2026.
//

import UIKit
import SwiftData

final class MyExercisesCoordinator {
    private weak var rootVC: UIViewController?
    private var createExerciseCoordinator: CreateExerciseCoordinator?
    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func makeRootMyExercises() -> UIViewController {
        let viewModel = MyExercisesViewModel(
            modelContext: modelContext,
            output: { [weak self] output in
                switch output {
                case .showCreateExercise:
                    self?.showCreateExercise()
                }
            }
        )
        let view = MyExercisesView(viewModel: viewModel)
        let vc = BetterHostingController(rootView: view)
        rootVC = vc
        return vc
    }

    private func showCreateExercise() {
        let vc = makeCreateExercise()
        vc.modalPresentationStyle = .fullScreen
        rootVC?.present(vc, animated: true)
    }

    private func makeCreateExercise() -> UIViewController {
        let coordinator = CreateExerciseCoordinator(modelContext: modelContext)
        createExerciseCoordinator = coordinator
        return coordinator.makeRootCreateExercise()
    }
}
