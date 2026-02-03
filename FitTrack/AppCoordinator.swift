//
//  AppCoordinator.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 03.02.2026.
//

import UIKit

final class AppCoordinator {
    private let window: UIWindow
    private let navigationController = UINavigationController()
    private var homeCoordinator: HomeCoordinator?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let coordinator = HomeCoordinator(navigationController: navigationController)
        homeCoordinator = coordinator

        let root = coordinator.makeRootHome()
        navigationController.setViewControllers([root], animated: false)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
