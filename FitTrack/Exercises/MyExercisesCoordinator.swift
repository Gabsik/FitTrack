//
//  MyExercisesCoordinator.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 03.02.2026.
//

import UIKit

final class MyExercisesCoordinator {

    func makeRootMyExercises() -> UIViewController {
        let viewModel = MyExercisesViewModel()
        let view = MyExercisesView(viewModel: viewModel)
        return BetterHostingController(rootView: view)
    }
}
