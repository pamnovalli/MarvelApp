//
//  Hero.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 24/10/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct Character: Decodable {
    
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
    }
    
    init(id: Int, name: String, description: String, thumbnail: Thumbnail) {
        
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id: Int = try container.decode(Int.self, forKey: .id)
        let name: String = try container.decode(String.self, forKey: .name)
        let description: String = try container.decode(String.self, forKey: .description)
        let thumbnail: Thumbnail = try container.decode(Thumbnail.self, forKey: .thumbnail)

        self.init(id: id, name: name, description: description, thumbnail: thumbnail)
    }
    
}


