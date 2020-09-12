//
//  InitialRouter.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 10/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

protocol Router {
    var navigator: UINavigationController { get set }
    func start()
}

class InitialRouter: Router {
    
    var navigator: UINavigationController
    var window: UIWindow
    
    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds), navigator: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigator = navigator
    }
    
    func start() {
        navigator = UINavigationController(rootViewController: MarvelHeroesViewController(nibName: "MarvelHeroesViewController", bundle: Bundle.main))
        window.rootViewController = navigator
        window.makeKeyAndVisible()
    }
}
