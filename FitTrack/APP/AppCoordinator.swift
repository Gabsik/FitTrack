//
//  AppCoordinator.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 03.02.2026.
//

import UIKit
import SwiftData

final class AppCoordinator {
    private let window: UIWindow
    private let navigationController = UINavigationController()
    private var homeCoordinator: HomeCoordinator?
    private let modelContext: ModelContext

    init(window: UIWindow, modelContext: ModelContext) {
        self.window = window
        self.modelContext = modelContext
    }

    func start() {
        let coordinator = HomeCoordinator(navigationController: navigationController, modelContext: modelContext)
        homeCoordinator = coordinator

        let root = coordinator.makeRootHome()
        navigationController.setViewControllers([root], animated: false)

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
