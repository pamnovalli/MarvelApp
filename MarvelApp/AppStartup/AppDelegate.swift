//
//  AppDelegate.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 06/06/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var coordinator: InitialCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator = InitialCoordinator()
        coordinator?.start()
        return true
    }
}
