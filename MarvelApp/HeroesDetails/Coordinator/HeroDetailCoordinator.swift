//
//  HeroDetailsCoordinator.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 13/09/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

final class HeroDetailCoordinator: Coordinator {
    private let navigator: UINavigationController
    private var viewController: UIViewController?
    private let selectedHeroId: Int
    
    init(navigator: UINavigationController,
         selectedHeroId: Int
    ) {
        self.navigator = navigator
        self.selectedHeroId = selectedHeroId
    }
    
    func start() {
        let viewController = MarvelHeroesDetailViewController()
        viewController
        navigator.pushViewController(viewController, animated: true)
        
        self.viewController = viewController
    }
}
