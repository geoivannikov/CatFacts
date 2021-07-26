//
//  AppDelegate.swift
//  CatFacts
//
//  Created by George Ivannikov on 25.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var coordinator: MainCoordinator?
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        coordinator = MainCoordinator(navigationController: navigationController)
        coordinator?.start()

        return true
    }

}

