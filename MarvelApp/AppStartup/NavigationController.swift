//
//  NavigationController.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 13/09/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
    func setupNavigation() {
        let navigationBarAppearance = UINavigationBar.appearance()
        
        navigationBarAppearance.tintColor = UIColor.init(displayP3Red: 159/100, green: 1/100, blue: 20/100, alpha: 1)

        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.init(displayP3Red: 159/100, green: 1/100, blue: 20/100, alpha: 1)]
    }
}
