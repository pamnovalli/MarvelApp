//
//  HeroDetail.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 23/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

class HeroDetailCell: UITableViewCell {
    
    @IBOutlet weak var lblItemName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareCell(with item: ComicsItem) {
        lblItemName.text = item.name
    }
    
}

