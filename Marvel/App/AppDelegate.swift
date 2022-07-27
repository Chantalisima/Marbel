//
//  AppDelegate.swift
//  Marvel
//
//  Created by Chantal de Leste Conde on 25/7/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        guard let window = window else {
            return false
        }
        let navigationController = UINavigationController()
        coordinator = MainCoordinator(with: navigationController)
        guard let coordinator = coordinator else {
            return false
        }
        coordinator.resolve()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        return true
    }
}

