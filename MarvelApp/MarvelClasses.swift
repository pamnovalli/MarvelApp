//
//  MarvelClasses.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 06/06/19.
//  Copyright © 2019 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct MarvelInfo: Codable {
    
    let code: Int
    let status: String
    let data: MarvelData
    
}

struct MarvelData: Codable {
    
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let result: [Hero]
}

struct Hero: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: thumbnail
    let url: [HeroURL]
    
}

struct thumbnail: Codable {
    let path: String
    let ext: String
    
    enum CodinKeys: String, CodingKey {
        case path
        case ext = "extension"
        
    }
}

struct HeroURL: Codable {
    let type: String
    let url: String
    
}
