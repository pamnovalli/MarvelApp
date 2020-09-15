//
//  SpinnerViewController.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 14/09/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

final class Loader: UIActivityIndicatorView {
    
    init() {
        super.init(style: .gray)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(in view: UIView) {
        prepareLayout(in: view)
        start()
    }
    
    func prepareLayout(in view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    func start() {
        self.startAnimating()
    }
}
