//
//  HomeCoordinator.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 30.12.2025.
//

import UIKit

final class HomeCoordinator {

    func makeRootHome() -> UIViewController {
        let viewModel = HomeViewModel(
            output: { [weak self] output in
                switch output {
                case .showMyExercises:

                }

            }
        )
    }

    func showMyExercises() {
        
    }

}
