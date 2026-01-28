//
//  AppDelegate.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 27.01.2026.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: HomeCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        coordinator = HomeCoordinator(window: window!)
        coordinator?.start()
        return true
    }
}
