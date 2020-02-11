//
//  StoriesItem.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct StoriesItem: Decodable {
    let resourceURI: String
    let name: String
    let type: TypeEnum
    
    
    enum CodingKeys: String, CodingKey  {
        case resourceURI
        case name
        case type
    }
    
    init(resourceURI: String, name: String, type: TypeEnum) {
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let resourceURI: String = try container.decode(String.self, forKey: .resourceURI)
        let name: String = try container.decode(String.self, forKey: .name)
        let type: TypeEnum = try container.decode(TypeEnum.self, forKey: .type)
        
        self.init(resourceURI: resourceURI, name: name, type: type)
    }
    
    
}

enum TypeEnum: String, Codable {
    case cover = "cover"
    case interiorStory = "interiorStory"
}
