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

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let root = makeRootHome()
        rootVC = root
        window.rootViewController = root
        window.makeKeyAndVisible()
    }

    func makeRootHome() -> UIViewController {
        let viewModel = HomeViewModel(
            output: { [weak self] output in
                switch output {
                case .showMyExercises:
                    self?.showMyExercises()
                }
            }
        )
        let view = HomeView(viewModel: viewModel)
        let vc = BetterHostingController(rootView: view)
        return vc
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
