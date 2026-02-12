//
//  AppDelegate.swift
//  FitTrack
//
//  Created by Ленар Габсалямов on 27.01.2026.
//

import UIKit
import SwiftData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator?
    private var modelContainer: ModelContainer?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()

        let modelContainer: ModelContainer
        do {
            modelContainer = try ModelContainer(for: ExerciseEntity.self)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
        self.modelContainer = modelContainer

        coordinator = AppCoordinator(window: window!, modelContext: modelContainer.mainContext)
        coordinator?.start()
        return true
    }
}
