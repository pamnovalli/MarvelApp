//
//  URLElement.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 09/02/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import Foundation

struct URLElement: Decodable {
    let type: String
    let url: String
    
    
    enum CodingKeys: String, CodingKeys {
        case available
        case collectionURI
       
    }
    
    init(type: String, url: String,) {
        self.type = type
        self.url = url
       
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type: String = try container.decode(Int.self, forKey: .type)
        let url: String = try container.decode(String.self, forKey: .url)

        self.init(type: type, url: url)
    }
    
}
