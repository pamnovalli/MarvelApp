//
//  MarvelHeroCell.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 23/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//


import UIKit

class MarvelHeroCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func prepareCell(with hero: Hero) {
        lblName.text = hero.name
        lblDescription.text = hero.description
        if let url = URL(string: hero.thumbnail.url) {
            thumbnail.load(url: url)
        } else {
            thumbnail.image = nil
        }
        thumbnail.layer.cornerRadius = thumbnail.frame.size.height/2
    }
}
