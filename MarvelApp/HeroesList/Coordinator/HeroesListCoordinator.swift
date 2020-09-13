//
//  MarvelHeroesRouter.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

final class HeroesListCoordinator: Coordinator {
    private let navigator: UINavigationController
    private var nextCoordinator: Coordinator?
    
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func start() {
        let viewModel = HeroesListViewModel()
        let viewController = MarvelHeroesViewController(viewModel: viewModel)
        viewController.delegate = self
        navigator.pushViewController(viewController, animated: true)
    }
}

extension HeroesListCoordinator: MarvelHeroesViewControllerDelegate {
    func didSelectRowAt(selectedHeroId: Int) {
        let nextCoordinator = HeroDetailCoordinator(navigator: navigator, selectedHeroId: selectedHeroId)
        
        nextCoordinator.start()
        
        self.nextCoordinator = nextCoordinator
    }
}
