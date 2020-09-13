//
//  HeroDetail.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 23/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

class HeroDetailCell: UITableViewCell {
    @IBOutlet private weak var lblItemName: UILabel!
    
    func prepareCell(with item: ComicsItem) {
        lblItemName.text = item.name
    }
    
    func reuse() {
        lblItemName.text = nil
    }
}
