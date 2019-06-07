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
    let results: [Hero]
}

struct Hero: Codable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: thumbnail
    let urls: [HeroURL]
    
}

struct thumbnail: Codable {
    let path: String
    let ext: String
    
    var url: String {
        return path + "." + ext
    }
    
    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
        
    }
}

struct HeroURL: Codable {
    let type: String
    let url: String
    
}
