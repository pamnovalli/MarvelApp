//
//  InitialRouter.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 10/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    func start()
}

final class InitialCoordinator: Coordinator {
    private let window: UIWindow
    private let navigator: UINavigationController
    private var nextCoordinator: Coordinator?
    
    init(window: UIWindow = UIWindow(frame: UIScreen.main.bounds),
         navigator: UINavigationController = UINavigationController()
    ) {
        self.window = window
        self.navigator = navigator
    }
    
    func start() {
        window.rootViewController = navigator
        window.makeKeyAndVisible()
        let nextCoordinator = HeroesListCoordinator(navigator: navigator)
        nextCoordinator.start()
        self.nextCoordinator = nextCoordinator
    }
}
