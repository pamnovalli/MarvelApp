//
//  HeroTableViewCell.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 07/06/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import UIKit
import Kingfisher


class HeroTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func prepareCell(with hero: Hero){
        lblName.text = hero.name
        lblDescription.text = hero.description
        if let url = URL(string: hero.thumbnail.url){
            ivThumb.kf.indicatorType = .activity
            ivThumb.kf.setImage(with: url)
        } else {
            ivThumb.image = nil
        }
        ivThumb.layer.cornerRadius = ivThumb.frame.size.height/2
    }
}
