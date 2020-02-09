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

    var window: UIWindow?

    var navigationController: UINavigationController = UINavigationController(rootViewController: MarvelHeroesViewController(nibName: "MarvelHeroesViewController", bundle: Bundle.main))

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}

